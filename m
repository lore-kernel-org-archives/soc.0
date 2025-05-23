Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8852478F24
	for <soc@lists.linux.dev>; Fri, 23 May 2025 07:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747985519; cv=none; b=p0DlYGyLr7HmY8iZ3IbR8/SJzkzeblFFMW1KQpXbG1hG88Y33dFiGmtwi10kWYDUuyuGgIkj8S39zwL85oCyLN+AVNIy+2N6MDIWmE3Id/U083qF29nmhyxjpUBOI1k33tnMkbFZiUuvg/aDK5lkJHFr5zeFE8LuElnn/02CgTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747985519; c=relaxed/simple;
	bh=1rU8KfdpOw/wwgN/qzAFAUH/2Puusqm5B5r9ppRAw14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cXOX0SVwVCuPu6EcY7g4i1LXYY9sx6nRVTb2VCmufnhuc6Htf/4/mE4cwoOb2Uf47cqV5Eei7sDRsQPTL/XRPdCLRUI+XPgmP1vIFzypg3n1R6Nh70Dx3XxEY7/aKVXnmebY81Zuo+dhBc/IuVD+nS55h3xMtlXnsGL21CxfIsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-87bf9d00e1bso1760545241.0
        for <soc@lists.linux.dev>; Fri, 23 May 2025 00:31:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747985516; x=1748590316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FD+nL4yd2I4+cbDko5AOqUkYfXfG+wQm1GId2A/CBdM=;
        b=gm2xP/TdnYaccBYzCjRvucuvgZ6s26tJkG2kqAUMNIenDX45zx9M2CJ3/G8G6q6h4R
         MXr62NEWYaGeAJBeu5M1wR2L8b2EZAqyAtzHaV3DWwH3/ZpsJ8bolo4xnj6WldtT/WNY
         SxNdmaNpotyv3QAFoXKky1PGi/1BYfXzwmrXufDahpEJTSn6/2LUAO4LKYCze4Q45xsU
         gX5zDN8dsni7tuUBsHg6biqB85jnI6b/R76K+ZfZFbcjvWvSPsXD3PKOku8jQjoApnb1
         MhyFMwGNsb6NNUhZAkNEWVi3BwTdqdWjgWG9cYsXlDEGLd1NXv2oM4sBevJJf/tU46ea
         6RtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtcu4vb5So8EVG2OprNZOJ5kGCYAg4GsQO70Hm0rz/eG4t5BB4Vp73c2tWyWl9LEYXgV0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSItsSw7vHijCOWlSE0M06rDLwh3Jx0ydPlShPjKb437Oos1aO
	/jdCfHJU9qS3Qw7exFwhQRukNt/4ZcUAxqEWLy1yhIMdNia8W7JTR4B5SRWNfVSh
X-Gm-Gg: ASbGncvwmyWIXahOuk0HigEvwTJlSaJE9e5WW998rhkz+7HY317Vm9jq7VLddBygcTn
	0aiCif5UHR7PZPQSqrk6EXl2OK78KxSRoIdF71qG8Midw7N5PbokKErJkoZOzrkbw2GSC+SsAzX
	x8WljQ7fjAtprSDuKM9vfA/qK6UG9Cte9MtlJxnZvGtTwqL2Gjo+JOgEJpTZdQeXpMR0dML3eY8
	Y2h79xrROMfUB99ctTVoXWdJ4GgiLKNWxjJMzA8Alp8grA4SGK1FD8xB9DdoLDlN6AbCjFM2h6/
	QjU4XkiUF3fyZI5Z9kK8JCWdmFQP0oXFABXIdBHO4SpMI5Gb5SZ13upq1qOHqy+tfdCsYLCwGTi
	N0QWKpEEb6UWGjw==
X-Google-Smtp-Source: AGHT+IHi6M6/zFCVXKgA0ZV2zTy1lkRNjNIeX8ssg8NOzLpjdi2VHXmfFZKpMhw1YczPAIWIcZWdUg==
X-Received: by 2002:a05:6102:4b13:b0:4c3:7f7:92f4 with SMTP id ada2fe7eead31-4e049d5899cmr23559711137.6.1747985514647;
        Fri, 23 May 2025 00:31:54 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dfa682e51fsm12245943137.24.2025.05.23.00.31.54
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 00:31:54 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-87be2373596so2655438241.1
        for <soc@lists.linux.dev>; Fri, 23 May 2025 00:31:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVL3whs92uM/8aZsHhL+OdNrKRDzmN62MQwEjk99JgNMRegDK0/H6HBw3nIhMbj5MLgBcI=@lists.linux.dev
X-Received: by 2002:a05:6102:8005:b0:4dd:ad20:a334 with SMTP id
 ada2fe7eead31-4e049d57331mr26428808137.7.1747985514143; Fri, 23 May 2025
 00:31:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250331190731.5094-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250331190731.5094-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 09:31:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmQ2uGR1ntERG7rS=VtNNZ734BMCQu=GaYgQ3sOMpd6g@mail.gmail.com>
X-Gm-Features: AX0GCFtFv5fcH5b31peoUctAzpCxkK7VzeLvAUvdWARN-L5YJkESt2RHNq335aI
Message-ID: <CAMuHMdXmQ2uGR1ntERG7rS=VtNNZ734BMCQu=GaYgQ3sOMpd6g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: delete email for Shiraz Hashim
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, Shiraz Hashim <quic_shashim@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

CC the address last used in Oct 2024

On Mon, 31 Mar 2025 at 21:09, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The email address bounced. I couldn't find a newer one in recent git
> history (last activity 9 years ago), so delete this email entry.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9bb1db9979f1..32f15c2ce531 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22627,7 +22627,6 @@ F:      drivers/accessibility/speakup/
>
>  SPEAR PLATFORM/CLOCK/PINCTRL SUPPORT
>  M:     Viresh Kumar <vireshk@kernel.org>
> -M:     Shiraz Hashim <shiraz.linux.kernel@gmail.com>
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:     soc@lists.linux.dev
>  S:     Maintained

This is now commit 3238532ba55c9bf9 ("MAINTAINERS: delete email for
Shiraz Hashim") upstream.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
