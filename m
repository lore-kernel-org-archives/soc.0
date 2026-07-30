Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF3D470123
	for <soc@lists.linux.dev>; Thu, 30 Jul 2026 23:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785454805; cv=none; b=g2YgzEPS2BNmzPY7SCcoOfnh5RvvXfTm8gpPvarM2IwRfv7yLivhpzQznx/kTsuf4go3AzfupWbVOb6SzKGVlUCbzFzny2zV49dmx64Bp6/j3IAN3kqNu7VC3RNZkX7RKaAhGdxNBuogy/MvCp4v/G/DKwi4OwhRUq6dGmebD1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785454805; c=relaxed/simple;
	bh=GPZxIJ12NCdT32FLt89aeHS/XUCWgFohujxo0l4BvtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uuaRT85jdcIk8/IvXaDccod1UOHUrNZC8GNooGFbrPQocdtSRV27dNnMtGHZhniYH7OsZkPvopRTfrmSMUEiXI65G/MgaIcZXdyjvV1WK7tOS4RIeCtvtE8T+gM8k/uV1dRIGR7Ru+xHmQUNjImRhJoYRDy5fM8eT6qnSUoPK1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=grHUIOzF; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="grHUIOzF"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so258165a12.1
        for <soc@lists.linux.dev>; Thu, 30 Jul 2026 16:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785454803; x=1786059603; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1swx6ZS7vRHB6s/IgYx4mgkiMyCPAEEjNZGLF7mxwyE=;
        b=grHUIOzF+bvdKxWF2723j0Yzcv95Of6Ro7Ai630HGRfudNBuy7ZvIKCnzqdvFaMRJ9
         lU8U74IdMAk3vMdue0Psn1Bk75wFu088b0u7QeJkhD33YbfH2brpuG90CudIEZxX+OUQ
         eHbau7LxdvyRN4zc4fKouwDT70oFhfzGuMRP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785454803; x=1786059603;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1swx6ZS7vRHB6s/IgYx4mgkiMyCPAEEjNZGLF7mxwyE=;
        b=NDIVMVe1CHdo7B+NNKVW0gg7jai3CReGdhW8oPNmrHy3DkUGKXJSPf3i6e8oo6w5B2
         Ewhnp30HpnikUgVFswrvWKpX1mKPBrI71rCC8biFDVcW071TrZtNVEtjZbS2UFBz52lZ
         iMmwfNpFl5YPsajyV+sZYTIcURoz1okUNKpmr/t6fKlFlm8mYXbMiSP/fSJ0kcrjfnpi
         7GV4C77TiOdjLU68QCWM91L9qUB6V7AWEIebUAyr+wMcRaa8ZliShdwSWEQ0teerxV1r
         3RbvQgoD/KAPDGMUWPQDgTdjflrzrXN2ZJoEoX9JPjYeyjUIPan0f8gBWco9B4X6xv6a
         N2FA==
X-Forwarded-Encrypted: i=1; AHgh+RqfJXk6pF8llX/Q8u3KrCljq4kmJxncUK4+t44pOFqJZwy+jScNOFW+oPW2AQ8reiXEXN8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn+QaYKaGSQqMD3bzFtADsrczOq8ExvFhPlhvXswd6e3shJJkO
	/6rOz+oNRIxZZG9CbwFO5wFqtgNGnyoRIHvSsmPTux8rUhr/J64rmZjGOcyN5yvIkqdEyXrsKD3
	ufRk=
X-Gm-Gg: AR+sD11fnSfhjVmZ6ewcKWJwKR00so+8AjiuUpNDSDRiM1eYtd0+qnyEWcAMeakdLhj
	mY3yVNA4R5gOaf/E1nMTzWbPi423gULTwVb56xrkDnoaNLLPWbJHYSsK2BgwCbgEYa7QYzvu0LS
	F5g6JTewygYbb1zU3OLuWID612IdKPRPp2XV8vCJzZ1mhs4fZn5ZgEgmJhqi2VcL9U96LWWG3V+
	ZIsZpbLoydCKUH59bjgeDyregwkXsfhGm+kIb1t3GqDX3Je2orMpi2oV3fYhkBtaO0z+nLrdshT
	FRd0el9LdtFVKsyfxHH5MwrFdOnLNw+oqD1pgBUvZwtYJkyrtkVea9f7/WtBp+17y6bcnLhp7Wb
	WVBjn/Tuu3lzjzUfFC5txQa7v7np5Pndp4YNSh3rRSFZC57y0KEowoVsEtDG1l6hDP+wLnAKYo4
	BY4C/MbSieF//DH4070hXeBF0a4020HAIhUHJGPAyCf8lFKdShix5svPy7QYVWZJ48aFMqzx89k
	otC2SFXsqOFZ2hVp8Wosn4pTcjbEcI=
X-Received: by 2002:a17:90b:4b84:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-38f9bd8723dmr3404064a91.15.1785454803143;
        Thu, 30 Jul 2026 16:40:03 -0700 (PDT)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com. [209.85.210.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9b72d25esm1632931a91.12.2026.07.30.16.40.02
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 16:40:02 -0700 (PDT)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so453206b3a.1
        for <soc@lists.linux.dev>; Thu, 30 Jul 2026 16:40:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqKY5Nm+PZGxnPMOBU5d73IZyhuJcPE56RFAZgOSTxy7HYP+6d2xaVgGaXQqnD5k08atlw=@lists.linux.dev
X-Received: by 2002:a05:6102:3592:b0:608:9a34:c8ea with SMTP id
 ada2fe7eead31-7574e6d1a1amr1650546137.10.1785454414391; Thu, 30 Jul 2026
 16:33:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-1-3abae9717feb@linaro.org>
In-Reply-To: <20260722-contrib-pg-pixel10-initial-dts-v2-1-3abae9717feb@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Jul 2026 16:33:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X32DiN2X26AutA97cpmywW9C3-76p-crT8sSQ+XqZNZw@mail.gmail.com>
X-Gm-Features: AUfX_mwLrAK1Nx-rPTyOqhPQSXAd6QqwkRvKOTa5fFmS8RMZbaeNFVMG8HEBq6M
Message-ID: <CAD=FV=X32DiN2X26AutA97cpmywW9C3-76p-crT8sSQ+XqZNZw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: arm: google: Add dt bindings for frankel/blazer/mustang
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
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

On Wed, Jul 22, 2026 at 2:56=E2=80=AFAM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> -  # Bootloader requires empty ect node to be present
> +      # Google Tensor G5 AKA lga (laguna) SoC and boards
> +      - description:
> +          Google Pixel 10, 10 Pro, 10 Pro XL (Frankel, Blazer,
> +          Mustang).
> +        items:
> +          - enum:
> +              - google,lga-blazer
> +              - google,lga-frankel
> +              - google,lga-mustang
> +          - const: google,lga

I'm not sure I really want to make a big stink here since I'm
certainly interested in getting something landed. That being said, I
at least want to ask about the "google,lga" entry in the above
snippet. "google,lga" represents the SoC and I don't think that's
technically required in the top-level compatible string.

I had a previous email about this that essentially went nowhere [1],
but I'm hoping to continue the discussion (along with other similar
topics) and Plumbers. The essence of the question is: how much data do
we really want to jam into the top-level compatible string, and is the
top-level compatible string truly the best place to indicate which SoC
is present in the system? While many boards put the SoC here, I don't
think anything in the DT spec requires it, and I'm hoping that we can
stop doing it for new boards. When/if we need the SoC info in the
device tree, it seems like we could put it somewhere better...

[1] https://lore.kernel.org/r/CAD=3DFV=3DW+jE_L_LLgAhD8K_4+CtivSD9-9t7Xe63X=
uKrKjfyfeQ@mail.gmail.com/
