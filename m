Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E73A3093AA
	for <soc@lists.linux.dev>; Thu,  1 Jan 2026 22:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767306838; cv=none; b=tXqv9pddmHBLwd1xn7jdChONQCy3UBLiO/hJAYorjcXXwnJlqDj8vWbKS4GV4+EivqnNReoasWZillobZ7Ve1PRkkg/Hr/C0jdtuhDZSpVApJrA5/eIsaWfUnUJDWJSqym8vDK/WkUGoAj/ZduPa/DhSEsVhVlYNgYhGPNRm8iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767306838; c=relaxed/simple;
	bh=p3Udg1A7dnizxaYQsat+vi05U+QBftMn1jOjMroxpb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W7i1xj4T1M5a3LAjYvUBSwS83LTP3MKmuxQbwre6xQxldrcnjNYHOYBqC1nMPOAs+tkZdDucKAfvmstUIHbGafSth0jp/O55NUtz4UVv79deIDaXSY6ZxVskqA7QxELuWLu9dzVZ7esWbQYcUhGqXIy5sqME6Ey3X6zL6AEYZhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dstsjtbp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dstsjtbp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25FDC4CEF7
	for <soc@lists.linux.dev>; Thu,  1 Jan 2026 22:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767306838;
	bh=p3Udg1A7dnizxaYQsat+vi05U+QBftMn1jOjMroxpb8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DstsjtbpXOrYo5m8FwZq48jb0bXLmWDdjx4YCVNiH8UbQHAbA5sypAGa7d4Zz052v
	 a5lEjgFkIhtTqO16RLRFE/8Kw2WIy6U7WfdbCHzVVKrEaIZ1ORXKMgmnzqh23tzSyi
	 2cWvAe0RebCV+oBwqHzz0o2bddmxXrI3uAL+svu1TtFEf1DpLVFWKqmjfBVqdZka9m
	 mt4yijoYcquN5YmVU7sC+ga5wgmieioSXb+ZFbdtnOn5GqrgrAhcQ9eGO5t5JBEmk0
	 Fyxpn+hrmToCZs1nsclXe3W5dE33qXypKTZClDVEbuvBQKLaJ+4geZfwGVDT64QKry
	 S7d3DWpOhVttA==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78fb9a67b06so90583537b3.1
        for <soc@lists.linux.dev>; Thu, 01 Jan 2026 14:33:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXBmjdjg1odyOhO1c0v3EyKeG8GXCjGA3shlkm6HV92+9c8NckXEi+CkghU3b6BgsTWQgE=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywhw5SZIoZNbZqzZTTy+cvlRHR2KLBi+5DIeAntj/ducsthhC2N
	+5DY30t+t0MSL7RjtHDkYBE1xLr8pa0yHJx4v0A42bOZK/cTyUcPZWFibQQchf84F8XBacPzD5f
	u614WRkPNTVG7p+n3I4hqZQzrBQ/jBT8=
X-Google-Smtp-Source: AGHT+IE8kG0dl6nfZ9rDsSRend9zuK0sDG20K86USLrsvME01KojRh37n5srP/xA0B/lLw7qk1QH4Fud+Fy7MLPqvEw=
X-Received: by 2002:a05:690c:4906:b0:78c:6ae6:3c7c with SMTP id
 00721157ae682-78fb40560a1mr335458777b3.48.1767306837261; Thu, 01 Jan 2026
 14:33:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com> <20251223142726.73417-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251223142726.73417-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 23:33:46 +0100
X-Gmail-Original-Message-ID: <CAD++jLk=9iea0qyDLy9dwmDEZZgkLcjsOPkw31ks=cEQ=qAQ8g@mail.gmail.com>
X-Gm-Features: AQt7F2rNFZ-MkfoJRD3W8h_DCYrEby3OkFKJI49Jsn33edPsbUed2eaZO-9R5iw
Message-ID: <CAD++jLk=9iea0qyDLy9dwmDEZZgkLcjsOPkw31ks=cEQ=qAQ8g@mail.gmail.com>
Subject: Re: [PATCH 2/2] Documentation/process: maintainer-soc: Mark 'make' as commands
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Drew Fustini <fustini@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 3:27=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Improve readability of the docs by marking 'make dtbs/dtbs_check' as
> shell commands.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
