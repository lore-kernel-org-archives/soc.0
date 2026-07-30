Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EB41D5CFE
	for <soc@lists.linux.dev>; Thu, 30 Jul 2026 23:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785454834; cv=none; b=bbvRTtTPQBkRV7vhuV2Jj1U5kxqLPTljg1prL+SOL4J3gYE0jZ0dbWW7O3fLxr1hWi47/nj7z9qyQglMjOCsbtFD6caCr/pBT00MG8KZc5VI8+7M/NOStUba5jTd7evhrph69wWOf0kgqsm69UJucD67MEzLwc5V4ZKcD0jD1Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785454834; c=relaxed/simple;
	bh=O0SjzN/C0aO3qHhb3UBjmXFOhQPDFTOsNKhcZLytoNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bI0XKWfsahgalT8k9MOaUFVKGedo6+9dIDVL9Y58rLSrYVWLGcX3WENjyavzWrz3I0i1DWCFmpjQnXXBMAcKLDNmVPOwMmoWlPpqyvA8vYuCT8FPPcQErQ8D5NPv5gwNfC0IwO0HwAkIbFq+5NUpuQgDM6US9l6vex2Ca96yyAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=McK7KY6F; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="McK7KY6F"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81e8fa1b8d6so5672637b3.1
        for <soc@lists.linux.dev>; Thu, 30 Jul 2026 16:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785454832; x=1786059632; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b2iUYeLjQUxHnF+XDQe2fiV8PKRsDwqLHqM0lXiq4GU=;
        b=McK7KY6FRyLo9rNouwn6bzY/IVB82iu8Y1B8UAzQeAf67H1pybo2bsU2901muvMYwA
         OIWhUO/r6ckw/4rPDSZne43rZX9z8WrbHomKbFFssqGLxlaTCnCJOYbkWdMg8IkXIeZu
         dF055B0VDNJpxSs3H+tMfWbi4VcYX0pCVKqjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785454832; x=1786059632;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b2iUYeLjQUxHnF+XDQe2fiV8PKRsDwqLHqM0lXiq4GU=;
        b=cVgJdz0IqvZy3gAPBu8aens32xZat/uziuLnkWGKArZDXLZ0uSK0TMkyzV9zTsJSAs
         SDrOe1WYhBvUycslbnsGJkscfAH+uoMvgFPEIKmJ7Fr5hP22TnrtcSgmRTkwSEISIHh3
         DrtTjAlJmQSONaITH+HFQS7dOYhPftdNubr/ebFe+GWKqdhfDVHCIfjkjmX1l1tkDWTm
         0UxbZZYh+4LNyVr1hM33GTkviMW5Tvx6BFTDFUpuxiBv2u072zfcKbArYbwR+9Ctpwsr
         y7MljFbUujTVQ2WGMF/gc9BnHwQkeeL3cx6ahwFe6faDE6OhUQ4LX7Gwmv2cq+2+nSuT
         Weng==
X-Forwarded-Encrypted: i=1; AHgh+RoZ6d7paVceexjJ6C5lTBfjr9DSuZP74okSRwktOuvKgzpm2TAqRwLDgoa/h1u2BdXDgmM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOHzm/f61qVmpqZIlWcHa+dBGCAUTIz69kw7SDkHmeicXa32ek
	JGL7CsqOeCO2UolJk3kub1ZrLn84ZtFO191ZYPn/RI3DYa/orB/mdi33+rj1c+61kNbpx+t9NCY
	GE3g=
X-Gm-Gg: AR+sD11safFtTYxbif9Clobp1oxsrArsLn3KTTKsWZa02kWgXDlkqd0lFfY86WxYbnD
	c4PqKzAaXS2PrYCy/EwPd/H9ObQ1SqYKX9tGBe3vXH3L7pbVD30SgCFTF5Hcig8K19SQt0fydIz
	kIrOV5G/fyaYgICLP8DgZqdP0dve8DLV2lrsFeJRB6j3SM4dcCUo83E827MJKQyjt2vrkvCQKQC
	maz7c9xBkUvEnJRzcQopL0TC5Lw5ag4+8Jl2rWo90ybbd0Fz5tNzSAp5daJgqN+g9tViMbWL+E2
	dw31CLCO5dW4O227+TPnViIIOmSEGWwNTo2PFrQbypdbHMlkP/lX6DzMmshKVCVt9xeD9sXBY+c
	koDAC1NnxIGrvTfg8qMjruh1NAo4MVPzs4NuzGxduwkOKkIamW6LrvyGxjSWYWP5Xog3ofMdMuo
	SJv6SkzX2QHuFy1q6ISCsWsjb+HrZ4j67jc/sbXHbz+PxuLQrxD6/J1e+ZQijszs5KFbCiN5sTQ
	/UgnpJMM6o5nLJokS2scIGFTAbT5TNXRbLuAx2j7W4=
X-Received: by 2002:a05:690c:88f:b0:816:a321:5629 with SMTP id 00721157ae682-81fb8b84cdbmr32224637b3.71.1785454831759;
        Thu, 30 Jul 2026 16:40:31 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb88c4a92sm18952317b3.7.2026.07.30.16.40.31
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 16:40:31 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81eaf3709b4so6058667b3.0
        for <soc@lists.linux.dev>; Thu, 30 Jul 2026 16:40:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqR3W5+8Aac2b6/k79GmpkgXzs/BF2ZOeDc14G3ML0PgVIKvbqf4g79FcjFsE0V5zTxrGU=@lists.linux.dev
X-Received: by 2002:a05:6102:14aa:b0:739:97bf:9189 with SMTP id
 ada2fe7eead31-7574f93a65fmr1607449137.19.1785454369736; Thu, 30 Jul 2026
 16:32:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org> <20260724-dancing-skunk-of-novelty-72c1b8@quoll>
In-Reply-To: <20260724-dancing-skunk-of-novelty-72c1b8@quoll>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Jul 2026 16:32:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
X-Gm-Features: AUfX_mwnyu4WjATq-AQcVkDVhFUfk_uPBliwju6dkYwZZ_ZMH3FiPhsyMK3Tdpo
Message-ID: <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 24, 2026 at 12:00=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> > +                     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LE=
VEL_LOW) 0>,
> > +                     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LE=
VEL_LOW) 0>,
> > +                     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LE=
VEL_LOW) 0>;
> > +     };
> > +
> > +     /*
> > +      * The Pixel bootloader considers it a fatal error if it doesn't =
find
> > +      * a `ufs0` alias so it can add calibration data to the node. Unt=
il
>
> Fake node is ok, but alias won't fly because aliases are not allowed for
> ufs. Well, would work 10 years ago, but this is a device from ~2025 (so
> SoC maybe a bit earlier), thus Google already knew that they MUST talk
> with upstream open source maintainers before they ship such ABI.
>
> They did not talk, so you reap what you sow.
>
> There is no more excuse for a vendor to ignore open source and push
> whatever-ABI-they-wish into their product, if they ever want to upstream
> that product.
>
> I know it is not your fault, obviously. And I know that not much you can
> do, so that is not rant towards you nor towards Doug.
>
> You will have to keep this part of patch out of tree or fix the Pixel
> bootloader.

FWIW, it actually _is_ a rant towards me, since I added the "ufs0" alias. :=
-P

When I was originally bringing up Pixel 10 with upstream, the
bootloader had a hardcoded path to the UFS node. It looked for it at
"/ufs@3c400000". That certainly wasn't going to work. Downstream
_still_ hasn't transitioned to having a "soc@0" node to put all the
MMIO peripherals under, so the equivalent upstream path would be
"/soc@0/ufs@3c400000"

Now, I certainly could have made the bootloader search both paths, but
that seemed bad to me because:

1. As I understand it, DT paths aren't ABI. While it feels unlikely
upstream would change "/soc@0/ufs@3c400000" to something else, I
believe upstream would feel free to and not consider it a "breaking"
change. This makes it feel unwise to hardcode the path in the
bootloader. In the past, upstream has renamed nodes to clean them up
and it wasn't considered a violation of the sanctity of the
device-tree ABI.

2. If #1 is untrue and we consider DT paths as ABI, it's still a bit
awkward. We have one bootloader base that supports multiple SoCs. The
unit address differs across SoCs, even though the IP block is nearly
the same (bootloader still adds the same type of calibration data to
the node). The code I started with had a bunch of #if statements for
the paths in various SoC variants, and that went away with the alias.
I suppose the bootloader needs to know the UFS base address anyway so
I could have probably constructed the node name based on other
#defines, but it still was a bit awkward.

3. I certainly could have searched the whole device tree for the UFS
node by "compatible" string, but the Pixel 10 (and future) UFS
controllers aren't upstream yet. We wouldn't be able to land the Pixel
10 device tree without the UFS bindings landed yet and I think we're a
bit far away from getting the Pixel 10 UFS bindings landed...

With all that, the "aliases" seemed like a pretty clean way for the
bootloader to find the UFS node. It also matched my understanding of
an appropriate use of an "alias".

Any suggestions for how to resolve this? Do we go back to hardcoding a
path in the bootloader and cross our fingers that upstream never
cleans up anything that changes the path to the UFS node? Would it
really be terrible to allow a "ufs0" alias for this case?

As a side note, I did "talk" to upstream shortly after adding the
"ufs0" node by sending the Pixel 10 patches upstream, but I guess we
were so focused on the overlay topic that nobody thought to comment on
the "ufs0" node? At the time, I'm fairly certain my resulting device
tree files passed schema validation at the time, too...


-Doug
