Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E059D3C342B
	for <soc@lists.linux.dev>; Tue, 29 Sep 2026 10:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676614; cv=pass; b=e0O6et3rb8srnm0agLm4NT2dW89an/VPKdNXy7+FQ8ixg1HFtUkO/SawiLrSxF1TeLsTIovCojU9tg+LebVMrAmHPP/PEuYxwFU7HOdAtOJw8G+2m7Belo3hTAwBaXDA4TvIsRv81LCVtNglcM6cSVxswJdNdR4W8NmPxvJYSRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676614; c=relaxed/simple;
	bh=ugqhqlW2+gdWnYyVA2uZcdO8IYtwk8wf07W/RuYSe7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UNh0vKbc5gGXh7au2Km9Bp+1iP4sVZzsGm5qiOHT6px9N+t1g4wwbtwCPjiQ9tV5P0tD0R3EojiMZlWo6eqDkIJQbtaJLxnbeAZkVepXcttTp7BMEqv07QTr7QZGpqsjV9I6//K+lj9lv2cjq3mtiXTU91FFu3MzZHKQG4w5JM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lSD/wABG; arc=pass smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lSD/wABG"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acae8342d2so947888a12.3
        for <soc@lists.linux.dev>; Tue, 29 Sep 2026 03:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790676598; cv=none;
        d=google.com; s=arc-20260327;
        b=bx0olmR+iRYPeFWXvDCHJj0y09AF81fHXQ6AeglR8JuXMVvIj80h2AOjKe2f3XcyrH
         AEzJA5MTFdf/gRVvzCKrdEhRgvgN1B+ci7LJek1owxSUKqp9WGgs3/bDfDCgkP9IMh1B
         QEXs1po5/LzEQY4dzEOXA3ffr7+6bI3oRajQQpFM5iIz14KlwKOfw5t81s1qiD+4sYr8
         rGm63CRlsbD0yFgE9/pYAFwm2I0lSwU3ReRvN3HAXjFPZLHDdeVtLCRfJ+QbU30TAKsZ
         mcHIwNnlElstgG73S6RZkty6qKIimkCYVjQLVXLMkBtpkArE/uu3HZU6BXZQNw6kzq5l
         +UWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dCNfmYcGaMILR8c3Q+T+COx/KTeJ3JVks807vI/GCMc=;
        fh=HRIAPspBhBJtRER9PI+6BcfDnv4u6IIuJdROarSEUpc=;
        b=HaS6G72I5wvJbdilIiKDczFTRCbNQ+/NSeMnvrRNPa1ybmtpbOXtXJ2DqPEMVlJ3nn
         AdJi0ztdI29ZjHYPiznhkz3JtOevJFYlpuYPfySXswrU39YfssIaiiVN4HFn+vggN3ZH
         aXdb7wdyKDKGZ/LL1YVMfvQJKj0PhCoMCroyJ8XqItSjPKWQauMmKASt//OlAFqEZuog
         NP0Fwle5xv4tfTK5eKPMsXdbtWwPZXF9l1TrRCkLMFVQAJ5JgUn0TkvFIkjWES5PYz3O
         ehDwkYCbmyQn33/EmhumYWsTfAam8T48b9CK3WyQH4vbYLkW9YutvI9ISyUqhtUIhvuL
         cfPw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790676598; x=1791281398; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dCNfmYcGaMILR8c3Q+T+COx/KTeJ3JVks807vI/GCMc=;
        b=lSD/wABGBgsHxZ3z1CZvNmnAukxwHYm4T3kVWnjmlGj2fB5SYI635qI8HtYBFWLVRl
         j3uBtghVFb+SmZQqcGdXQr3Ne0nj0vx3iVj/sRqXP6N4sf7QhVW6837tuBs3sElZcqBo
         qCnFIT0PSDqfWQsAG2zIIgz0yPiVp7J8nFoZV+cokCw65aeAdzrkIFkJFXRUU1wrtj9S
         +YFEpIupQfWX7xWQxys5AdiOBp+VNuuJf0F+JcZcvf46EOaWuLNMtV0n6X8G97li0Xfo
         sjfCDRa6Q+1uwA9+LrpMIzKKUrR66bHJTlLRXgHg2b5HSvAsdPNHuv1Xqy/6o5ksKnSr
         KGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790676598; x=1791281398;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dCNfmYcGaMILR8c3Q+T+COx/KTeJ3JVks807vI/GCMc=;
        b=IMGN8KCx9wrQOGujFlSwTrWFzce1AjAGkdZeiKkbkX8bTWdWtOcpUnKqlloa9SrKPw
         nvHNpHd9pb23jUgTD4nActOiH5jhGDD+bnDkQlEw5GPgLbOux9UQzk/E0pBwfzFT+ehN
         c8klp6oVL9irOCmrwBW8kbqJC9QWPVn91iUMY0KKtJbDMJ90AiKhYcTxxs2ou9MeOgas
         bMsptsd53TW/ogZNaqveXhmqqGVW9YM87V2jvskl4x3eGl7NfTgbzW1kk03X7MzXFiRZ
         eKXV11ZIqNl+RjL6rpns+mJlxeOC92f3U0UJ677cPK9BB4wNs5Veh99S5rNb5Jz8TkVJ
         Y6Pg==
X-Forwarded-Encrypted: i=1; AKwUvBwUBwoTV1VrwoW0HksQ2WAC+XIfLk9szRVM8urDe0D1zhTdXmPnQRK548hFRefZlh1bnqc=@lists.linux.dev
X-Gm-Message-State: AFq9FYKwKQRZ/fu5JeibU0O3si1sohJNJ4/QIxAEGX9mCoHsZswT0RWR
	5z5bBIccnnFEB2d7CQekl9Q1jAC+eO9QmiOid/KmCc43EgpC2SEpsAAbkq4h859OWXln69NKmCZ
	JFdzej3jLEw9h965UU139Y14xKfyi3pLIj5LCcLofjw==
X-Gm-Gg: AYBFou06ytPTTpASLgM8Z9M+U83kBatqbg6EMJfG8S86lPUoMbqz1H8xGgn40CUHen6
	6KpgvVh4yg+wsaia2tT3q8VxZiRgf2yncmVxD9TQrCN0SJizUe+Vg/pMOl2LL5SghuCAXiuElka
	qQPdmVIcLsCgpzyHHAagyyCupkyJv/GmJakzynD4mX79lXfbRf5wsV1U4Gtko9kg1YaOE9HF9vr
	MnIZtSWimX3naLHBtlFLRG34YzvtVQlXW5h6nxbBhCIeGsyRjdTw4fHYWYdoxtFp69H93y0cfra
	Ru/oVEsrEny/CmckEE6i66iDvEKCDMgvWfutgiQDpN58CkRnr3IdnmbGqiwzm+vhJFiX43C5GB1
	klJiwnCJehXjcGi+tcE5KjBQ=
X-Received: by 2002:a05:6402:3059:b0:6aa:9f53:221b with SMTP id
 4fb4d7f45d1cf-6aac8ecf650mr10133940a12.4.1790676598186; Tue, 29 Sep 2026
 03:09:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
 <179067486422.102650.10176830320558486814.b4-ty@b4> <550a74bc-f0b9-4141-9fc8-db175bb0b1ae@kernel.org>
In-Reply-To: <550a74bc-f0b9-4141-9fc8-db175bb0b1ae@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 29 Sep 2026 11:09:45 +0100
X-Gm-Features: AclHuK9WRHV7MmouzYCiFz5qe8OcNiIlPS3cNCTz_rrKcfw59IxyOBRtgpvUaFE
Message-ID: <CADrjBPo_V1YScLQkgbSrWCaq30k7JoF0GQQ0u5ouBiEipbEg4Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Add Laguna/Tensor G5 SoC and Frankel, Blazer &
 Mustang boards
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	Douglas Anderson <dianders@chromium.org>, Juan Yescas <jyescas@google.com>, 
	RD Babiera <rdbabiera@google.com>, Brian Norris <briannorris@google.com>, 
	William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-serial@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krysztof,

On Tue, 29 Sept 2026 at 10:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 29/09/2026 11:41, Krzysztof Kozlowski wrote:
> >
> > On Fri, 18 Sep 2026 19:05:01 +0000, Peter Griffin wrote:
> >> This series adds initial basic support for Laguna (Tensor G5 SoC)
> >> found in Frankel (Pixel 10), Blazer (Pixel 10 Pro) and Mustang (Pixel
> >> 10 Pro XL) phones.
> >>
> >> Whilst Tensor G1 to G4 SoCs (found in Pixel 6 to Pixel 9 and Pixel
> >> 10a) were offshoots from the Samsung Exynos family. Laguna is an
> >> entirely in-house Google designed SoC.
> >>
> >> [...]
> >
> > Applied, thanks!
> >
> > [1/4] dt-bindings: arm: google: Add dt bindings for frankel/blazer/mustang
> >       https://git.kernel.org/krzk/linux/c/ecf6405fa6c503c34eb4e7e905957d70d4018e93
> > [2/4] arm64: dts: google: Add dts directory for Google-designed silicon
> >       https://git.kernel.org/krzk/linux/c/cf3df78629f24b40cd0cb2da74e3ea4a944bed82
> > [3/4] arm64: dts: google: Add initial dts for frankel/blazer/mustang
> >       https://git.kernel.org/krzk/linux/c/54edd8698bb1fb40c339d0cb2f15baad6993dd48
> > [4/4] arm64: defconfig: enable Tensor G5 SoC family
> >       https://git.kernel.org/krzk/linux/c/63f674fe8a0a8d6e4bee3e72f7ae658f0e9a0686
> >
>
> This introduces new warnings:
>
> /home/buildbot/kernel/build/arch/arm64/boot/dts/google/lga.dtsi:368.37-391.5:
> Warning (avoid_unnecessary_addr_size):
> /soc@0/interrupt-controller@5880000: unnecessary
> #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
> or "ranges" property
>
> https://krzk.eu/#/builders/28/builds/845
>
> Probably you wanted address-cells=0?

Urgh, that must have happened because I removed "ranges". Let me take
a look and get back to you.

Peter
