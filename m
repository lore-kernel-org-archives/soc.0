Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE6F3E49EB
	for <soc@lists.linux.dev>; Tue, 29 Sep 2026 10:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677011; cv=pass; b=mPXNNcdMvrpMTD0sSjw3MEg45ASCGuo79CnGtTajyxaSyRQbZSTOJlqM8Pmjy1rPOR8UDPIBZFe+j5KxdLKSLB4RDqhJMuI7aOOGkxPoG2yE07zWIimRdcWof5hgMo+5JETK3snCSD6moIt2SHLVN1MULRn8M7Ziqifta7332M8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677011; c=relaxed/simple;
	bh=/pURnOfPd01iygyLUjpNk9X+T4L0SeXg5/g8Qb1SX8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y1H2VajfJZQWFtz5HB985CoPGmkdsPCrP4nwXYbrdMMxFCFB4TcdvEbyMbnbPhIRpbeibRHQ4r3fGlEea6eFhziuI8LR9Ug+qC/mphZITwZIRELga+g2ibfKRqcXFMFwZeKapLl3dEt6zZkrGSFjLpYLM3Oiv01q8fxMk+Qg64A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x+Me4EzW; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x+Me4EzW"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so6407811a12.3
        for <soc@lists.linux.dev>; Tue, 29 Sep 2026 03:16:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790676999; cv=none;
        d=google.com; s=arc-20260327;
        b=N5SYIvCka0BQduhrtdbf2dvut3BqUGOSVybHATuS69usvqKeq6btxRkU1Vry8UOaN1
         tlLr/YHG6tcgtoQvd3J3KVKfAcLQEy5i1QScr92gNVPcSof/HNGUmlx5fZOLWFL/p2Kt
         EVkqYkBWpRWKbfhoulJBby1ypkMdLG6/0Bs8ZoD/wdjMoEZBVoPeqbpiiiMK2ixcSMRk
         ENrHwdWnFe1Zh7GPh1zRgn1au6wvrTUP0fs456hYACMZ4av8kdCuVzE7JtAvCpC9gkHr
         Op8gjrs0QCNF75NLbdVd5FDumqvXJFTLBi/Nud02vvOJWYAeNJIdwRAGBarUjWld15iF
         gsVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+Y0oCiGlxm1oUL4ENFDzbHLN3RbL4NXvE+8S8i9hNs8=;
        fh=pwR32RbS55cjoz8K60cJ2YCvpno1U7/MBsKCLjPqwoM=;
        b=sSlcOAFupVc6ZbsOd+cYQqblxz12vq+tdkp+lqa+p7d8P7HtxTj/1yX1VvSaI9wBwi
         EqQn29qVn7RKTL19tA2TaqiOQwyGAUblWFZjj55eUQScY66dQPfRCOxYEYbDn/3ExX4s
         XnRu8FP7y1B0jL7Ki4CWF1XgSM3tOGe757o+vsxNoO1zVgVaSFvne13xSw+cwGasksKZ
         r8J/bzWS8j9NiTehTkpbyadp5t9Zf2QD9PZTK4vSDZxYlbzr8CslwyoojEmVDAK4x0gJ
         sm9oU5Lh7z+9ywoexFkd47BBIzMW8GJ2Op8cJTTPmQqN3gZr037t8wJBaUXvTQIbi491
         N+5w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790676999; x=1791281799; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Y0oCiGlxm1oUL4ENFDzbHLN3RbL4NXvE+8S8i9hNs8=;
        b=x+Me4EzWxsMmu2eJEyqJR0EQQUuK8YugziIAzmjoLI3pUL3dQTaaAovx4y27QeasVH
         7iod8Z5n36zRY45Fh3qyjWpmuE/DFR4X+MCPeny02KuRtS80bD7IRTkLso0hf4WlaD5k
         p+nd11TqH55hNzNGgSQ68GrwpF+IGq9FdcyijU9+TvEIHdvJD2WHR6GpW21Zo8qPU6sX
         yRPLG54s2EUw9PKKbUKwNOD3HGTQYEYmOuKQoka61cmja2mCgZH/Slo5auHatkbYRlpD
         akHmm5otUHlQPcvO2Oqa96woFflRFHaAdOLi5ZxGyP67gSiIu6jJaHMq1pMz0jTQ5QXj
         w1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790676999; x=1791281799;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+Y0oCiGlxm1oUL4ENFDzbHLN3RbL4NXvE+8S8i9hNs8=;
        b=NYRmKO4YFGO8/iOiBPIjGkKSWFAgRon3OfyTUcsppGLyXxg88Rrgb+M7R6N2xIhEdU
         9ocUvYutKPX2s8+CXFT427LDQpgtKs1Cpgr819oGIfgohWplGM7ZtI+vkebOgqdy/w1U
         4HFF3jSy98xI3qWRbuTghFZnrjZay195iwiFr5y7flGJEeAA30PjyXwDNRHKEKMhW6Yd
         47bwkPSn2djq7El7srn93ItV9yZcHTYRsXaK+vo5bb5b4pctCGmIJ6nU8FYxnlC+MoAR
         RoeyeqSjljH+yU3puSsntMA4vVJCVBrSsWP/XLfCchSyJqkCSaRCoauEdY4bEDxnqrGx
         AU8A==
X-Forwarded-Encrypted: i=1; AKwUvByzgx8MVYP2v724xgQyJLXI7yjuL1W0VmWzfcFH/ILraXjgj3Tpxgz+H9Ptg0a6P/CbchA=@lists.linux.dev
X-Gm-Message-State: AFq9FYKl6uPel+vx+8hik5KZvNSPoU4Xjx0dhN7dTTFyxHvC2R83TNAU
	PDNSTod1t2I+GDasVICu0v//wWc9RxxcKFO7zplP/fOfbUwEDgIulEsfUhSFH0A1SnavHsyyO+C
	fer5d++H8MvJgdr/JMIrN4bQvTc9tchEcq+LWV5rNuQ==
X-Gm-Gg: AYBFou2PV5SB+1ZJ1uSgkMXa4sPngIS4uhPuIZjImBtWjxOKbP6cU3yNmFbWsqgXUj/
	HvQewxx9lued/lhEOtWvpSKA8wIZEOlsce+1FC6yGBuLWFPavzMvAOXG6C6VF48uF3sJpIHk507
	SYhkTtNoXneYeGorNiG18yh7kNRXI9EcFmcc+n4ggAnYNa+FNG1rZjgt/i/GmqNKJNFIfyf0Giw
	Nz7ku8ZvDKjcxzqX4hOB9SR8HpXbVJcvAgJvrXeE8T6+1VlRRgDnkFS3sjiWOo5WREYrvEihUI2
	hjEdzXX12MAKjvs7JAsK5KW9Q3nPaz9xiu7fRZtheoYBmGXqK5T36UGyAPseCwa4mb5GR4fHTwI
	EO/T41PnxyjAw1hjfRcqz45k=
X-Received: by 2002:a05:6402:c212:b0:6aa:e589:87de with SMTP id
 4fb4d7f45d1cf-6aae5898986mr6832193a12.20.1790676998743; Tue, 29 Sep 2026
 03:16:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
 <179067486422.102650.10176830320558486814.b4-ty@b4> <550a74bc-f0b9-4141-9fc8-db175bb0b1ae@kernel.org>
 <CADrjBPo_V1YScLQkgbSrWCaq30k7JoF0GQQ0u5ouBiEipbEg4Q@mail.gmail.com>
In-Reply-To: <CADrjBPo_V1YScLQkgbSrWCaq30k7JoF0GQQ0u5ouBiEipbEg4Q@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 29 Sep 2026 11:16:27 +0100
X-Gm-Features: AclHuK9G694Ra3CWigev-SgKIG1dKrfnmFi4vSCyiq_Xo-NTi_Nls6PiXAbko7k
Message-ID: <CADrjBPrErWJR_01+Qhuw6mu0Kpe8-tvBMjci=rBO13RaSqnfZQ@mail.gmail.com>
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

On Tue, 29 Sept 2026 at 11:09, Peter Griffin <peter.griffin@linaro.org> wrote:
>
> Hi Krysztof,
>
> On Tue, 29 Sept 2026 at 10:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On 29/09/2026 11:41, Krzysztof Kozlowski wrote:
> > >
> > > On Fri, 18 Sep 2026 19:05:01 +0000, Peter Griffin wrote:
> > >> This series adds initial basic support for Laguna (Tensor G5 SoC)
> > >> found in Frankel (Pixel 10), Blazer (Pixel 10 Pro) and Mustang (Pixel
> > >> 10 Pro XL) phones.
> > >>
> > >> Whilst Tensor G1 to G4 SoCs (found in Pixel 6 to Pixel 9 and Pixel
> > >> 10a) were offshoots from the Samsung Exynos family. Laguna is an
> > >> entirely in-house Google designed SoC.
> > >>
> > >> [...]
> > >
> > > Applied, thanks!
> > >
> > > [1/4] dt-bindings: arm: google: Add dt bindings for frankel/blazer/mustang
> > >       https://git.kernel.org/krzk/linux/c/ecf6405fa6c503c34eb4e7e905957d70d4018e93
> > > [2/4] arm64: dts: google: Add dts directory for Google-designed silicon
> > >       https://git.kernel.org/krzk/linux/c/cf3df78629f24b40cd0cb2da74e3ea4a944bed82
> > > [3/4] arm64: dts: google: Add initial dts for frankel/blazer/mustang
> > >       https://git.kernel.org/krzk/linux/c/54edd8698bb1fb40c339d0cb2f15baad6993dd48
> > > [4/4] arm64: defconfig: enable Tensor G5 SoC family
> > >       https://git.kernel.org/krzk/linux/c/63f674fe8a0a8d6e4bee3e72f7ae658f0e9a0686
> > >
> >
> > This introduces new warnings:
> >
> > /home/buildbot/kernel/build/arch/arm64/boot/dts/google/lga.dtsi:368.37-391.5:
> > Warning (avoid_unnecessary_addr_size):
> > /soc@0/interrupt-controller@5880000: unnecessary
> > #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
> > or "ranges" property
> >
> > https://krzk.eu/#/builders/28/builds/845
> >
> > Probably you wanted address-cells=0?

Yes, it should be:

#address-cells = <0>;

and no size-cells line

How would you like to handle it? Shall I send a v5, or would you
prefer to fix it up locally since you already applied it?

Peter.
