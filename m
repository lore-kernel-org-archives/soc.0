Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E701431E828
	for <soc@lists.linux.dev>; Fri, 19 Jun 2026 10:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781863964; cv=none; b=TjWDe/stQdFXaNx7Ap1/s8vbbYGuBniqpyKHSXwMMaFIS7jaBaqNIeXnPzEsiMlXkkh6hD8as3bGwSy9xAlIXjSUA4csRBqU910ffhNNCVJPDFs7NFajAVNWcRemRayZOyvE7if+GjmdD4LMvD90yi/zUKy+ZG0QnCqiy47DUmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781863964; c=relaxed/simple;
	bh=HnFVEz8tnwh8uf8B8n8HRCRNYqCLQiG6fMsUIsLGxvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujYb2x60UYPy6QUPhbj+LIlika53/2Ao3w9+PmFAFIpOtDa8GYTVLIXj4Y1vl1ea/BfriWMvEKenJ2nVDkjsTgD1Y8pgQnRQWKGccsVj539dFs1rzagUE97I0RKSprDoBtqOmSZIQpRdYtFNNVV5awXPFFhumOci2IZFt6vTI0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-6c25b040555so1543507137.1
        for <soc@lists.linux.dev>; Fri, 19 Jun 2026 03:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781863962; x=1782468762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mo1PDIngVzQULrr58NN09VAskSnKfapBsMnXdORM01Q=;
        b=aWH7L4xUZwqX5ztzhGiNKi3mRDnsib1lT+7sJFL2MEg9RRk3OmRENTIp9EH1Kc9c49
         GEPjwIZg2KDaCVHtYqDsRS7Rm5cVhaxuHUDjaqepf0Q0M2uijfCi/qxHB0vMQlItDJ5g
         SLDmWIXo2C1VwxnhWUBvyTb0aTI3UNFIEVU/3UXMex7BHBDtO743DG9cPA1c7pxFkblc
         5Rk8xvs8pUSmPB6mUoFspnr69Pee9BYw4k2hz9nYaL7PavuOKlzudbUJbRO48yo+iRYb
         V3hMl3aPloBVh8QFpiAKm6TAsGegNQH2ey5b+D2vhIwTW2dTtanWInqjUGf0sKp2+TUB
         GJkw==
X-Forwarded-Encrypted: i=1; AFNElJ+s1ivWLkYXfgoxO2W2tOF3pi71w81UiYXG3Xz6r4u+LrpOmMUtpll73zeDcMp3CHF4Cy4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxYFTqyj7/eP5Oblfni2z9XU38e2cqlJ2mWqmvfXzxKOWYiQ5vp
	NwNY1lTB53TRJLuc0sMUuLEWKr9usroQfno8QWfP2wvgwQE60pNnMytqL+wcomD1b8w=
X-Gm-Gg: AfdE7cm09Z2MXMkkQVS01dTb0my/0b6iWQ7H79LNPu4jgy6cNUcuDuNOJgj442lkgnz
	ZLbPpkOMWa1peJTGhEQFvshVSNKCRNGKsX0+fP3vfddfirY7brRPLNruv/nXDxVqIkzZpAlXt+i
	Er4vmYScf3+Pex8Fv/FuHattD8v/24m+dxxYl/LYNWZd3iBSXzkMsCOSmfw2YgtRJnL0YvIeRaP
	kNkY6uyIqLk9Td/cTJ44ruWrXPuz4Jllv4Kk/jjEc1ku+qj0tMXR8CG56jB+/G+kD40sa1+nVEc
	urCcDjYaI8jlFibwlLANqbDl7XQAEBWsTEbxe43vjVKJFMV0B5prQ2hcx0TpSX4dxwY1Nt0JHvM
	CXKtiSE9ZPV4GNhq8sePHdKUKa96exo7pudsuGHWUSUoW/Ey0YpMnEd0J+l8hhbfbot19PO3Rmp
	wfI8qa/bELfEbE1VFE5WI3ZnZY69fvM5fq9WfJoFIriReHBucJTw==
X-Received: by 2002:a05:6102:3913:b0:726:8813:2078 with SMTP id ada2fe7eead31-72a7709766amr772583137.11.1781863961868;
        Fri, 19 Jun 2026 03:12:41 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72a342eeea5sm1312769137.2.2026.06.19.03.12.41
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 03:12:41 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-963d7e5ffddso1304561241.2
        for <soc@lists.linux.dev>; Fri, 19 Jun 2026 03:12:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8UMoo61VWeXK0UvqwGlMmSucoR7RGEL+3F0z8xYtgqNjUG3wgoLNE/pT23BYMzgQ10JvQ=@lists.linux.dev
X-Received: by 2002:a05:6102:442a:b0:631:b365:40f6 with SMTP id
 ada2fe7eead31-72a791d4da3mr721038137.23.1781863960783; Fri, 19 Jun 2026
 03:12:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com> <20260429-defconfig-v2-4-e4ed4186028b@oss.qualcomm.com>
In-Reply-To: <20260429-defconfig-v2-4-e4ed4186028b@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Jun 2026 12:12:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVH6-5ZAjTyF3m=wF5-XiSDqwcgRhZWxJv6y0FoCnk4MA@mail.gmail.com>
X-Gm-Features: AVVi8CcCiAuscESS9Te8rq8dRuRPJ8mfjoiRkMDvKP9iUla4C6bw5NFeJgmISd0
Message-ID: <CAMuHMdVH6-5ZAjTyF3m=wF5-XiSDqwcgRhZWxJv6y0FoCnk4MA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: defconfig: Drop unused Ethernet vendors
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Wed, 29 Apr 2026 at 20:52, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> Make going through `make menuconfig` easier by disabling the unused
> Ethernet vendor menu options, where no actual driver for given vendor is
> selected.
>
> Impact checked with comparing old and new autoconf.h:
>   diff ... | grep '^-' | grep -v CONFIG_NET_VENDOR
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for your patch, which is now commit 32379ad4060b6fc0
("arm64: defconfig: Drop unused Ethernet vendors").

> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -349,15 +349,33 @@ CONFIG_VIRTIO_NET=3Dy
>  CONFIG_MHI_NET=3Dm
>  CONFIG_NET_DSA_BCM_SF2=3Dm
>  CONFIG_NET_DSA_MSCC_FELIX=3Dm
> +# CONFIG_NET_VENDOR_3COM is not set
> +# CONFIG_NET_VENDOR_ACTIONS is not set
> +# CONFIG_NET_VENDOR_ADAPTEC is not set
> +# CONFIG_NET_VENDOR_AGERE is not set
> +# CONFIG_NET_VENDOR_ALACRITECH is not set
> +# CONFIG_NET_VENDOR_ALLWINNER is not set

[...]

I am not sure this new policy is a good idea: none of this affects
actual kernel size, but it does increase defconfig size, and churn.
E.g. for the m68k defconfig, I dropped all these disablements
several years ago.

I don't use menufconfig, so just my 2=E2=82=ACc...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
