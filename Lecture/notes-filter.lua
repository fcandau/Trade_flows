-- House-style note blocks: a fenced div  ::: {.notes} ... :::  is typeset
-- small under tables/figures. In LaTeX it is wrapped in \footnotesize; in HTML
-- it keeps its .notes class and is styled by course-styles.css.
function Div(el)
  if el.classes:includes("notes") then
    if FORMAT:match("latex") then
      local out = pandoc.List()
      out:insert(pandoc.RawBlock("latex", "\\par\\vspace{0.3em}{\\footnotesize"))
      out:extend(el.content)
      out:insert(pandoc.RawBlock("latex", "\\par}"))
      return out
    end
  end
  return nil
end
