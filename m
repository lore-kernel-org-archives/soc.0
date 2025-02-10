Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19C11EF093
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 12:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739190580; cv=none; b=LuiMDVNtQng4LOvv7sQ8Tm9F76vctU6Bd3YJjduQKxrgh6ATidK29NI2BogXqvN0EcA0m0t+LlXhUbraz9t7TZ84pM5VV1tM9/s50wdNu2vgthhrbnSEVvhwZjBdc7AUcZQoWhxwa1moiGFiITRuRGC0nfhN+PRcrLZN9I6IrtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739190580; c=relaxed/simple;
	bh=IuFvjydOw4L18BbCARPfPkycdVqb1Ih2e3bRySBUmBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V93BKWG/l2ym7NuAA5qQBAhyB31XqUFcTAvHR7onhwcEWQF9Nkfgf8P6qD6Uc7RRO0fZmfNc5H9Bto8K8qe1hYYjW25ZfMou1D5bqUY5rOabPk3JrQKRxHdAmLBaPBRRu8sMYcAGnle5k08zL+QXHNSr4Paza3E1laAklndd28s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGVmi8V8; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGVmi8V8"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c05d75007cso134518185a.1
        for <soc@lists.linux.dev>; Mon, 10 Feb 2025 04:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739190578; x=1739795378; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zY41R75BtToe8Yp09lMS5d4lVXKY/PmgZc/Js0T22zQ=;
        b=jGVmi8V8Ij1ilKt1xRfje/SPhxyJPhr2WslnC7fgD/hHu7bWqVHC1S6TUK1Y80OG8j
         ZWFBc2aQgnVzMdHkt+S39eIEMUmTLDI2Hymqt5sYva34cuU/TjCainX/jZXSTNRATQyL
         Y4UPJX+YWBe0M0OMFS52XeuefMMvrNMlJYrN99VL9h2DGqDBH3JBhvRinaqiHU039fBB
         i4ktCDAkCUIMhtTWvL6CkaXBci6C/iZzbQdL0ETr7QFr9mIMlkbGutQHcA32cYaVBTvl
         c31xdfwLY2XOUleBZsTM6fGHj8IZPdGJosX7rm05gzs8Pws/8G+TCpt5ApCjNTWnfeVW
         nD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739190578; x=1739795378;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zY41R75BtToe8Yp09lMS5d4lVXKY/PmgZc/Js0T22zQ=;
        b=dNyuYdeT1mOT/xqAx96a3dqoblZC0CFDtmmurr8HiBLiKeffnRBIOVpKJVKlunvQS4
         6Q3Y9II0LUEWa5BOTbruIwdKxfMaaUeiHxHGqtr/binQiD8wDCHS7Rc5ZO+4qXbIKo59
         vsooYjr3ckjDyvOrX1qYSuBL0h6dPYcOngCpxiQiOAQsB6oHCo8MgVEm7Wdg5BTjyxjw
         oq5f0KtFDrJlkpsT0EIkOH1PlhPTZra1HXbeC4wzK6cno3hIKi62f8kNHwKX4//ZLMNP
         d/3p1G/rIPTzkfZJbx1R+oI8iClvJdanCD/gSvTh0Y34MN/wqDyUwmhs6p9mOtSnDqDt
         8lvg==
X-Forwarded-Encrypted: i=1; AJvYcCWggsdY4rXoDzC4fMHzt1sJ4MQMWuPCPjNGLmFM+CGHKHoB3ado6T+WanJ0I+kwKbEYSp0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwlgfyDrLyl2281fYPjrtuWMO2QSMYtyJE3gwNAnWnOHZXf6MYu
	wWyNMbTe7LuUpdpgu9fAsZwzn3uysRvycxZ7syQSgFHLbPGAQvyM
X-Gm-Gg: ASbGnct6bAg/mwWe6cSfR3Ht6TufemlTpBUCmwDd2Qc3UUgiQOBeawF3bPR77CZKKJL
	j7WgOBABjmz0ccKWEBaRREagjUrKwysF7p0xT8DjJpLGYwbp61t5u9s2IIuxd7MKqNFINWXILBw
	w95wo2R7r7w9k3vcjd6ogJeoJ5spGwTw+EXX717GpNEcHAJ+v5xoeU9z33LKwek0pjWi0KW7Y7m
	4JQ4yX7bGeiCxEc0sRMVZ1rutVf9JorlUtxJOHMSWHHytwua6OjNqVV+m2pA6dm2zA=
X-Google-Smtp-Source: AGHT+IHxp1/RlBBU1ek47PdaAYXfy4dhK7yLqQmOezqp2bSrFyZup9k7QBohFKb20v0D2hY4RciUgA==
X-Received: by 2002:a05:620a:319d:b0:7a9:c129:5da7 with SMTP id af79cd13be357-7c047c355c8mr1853489885a.29.1739190577686;
        Mon, 10 Feb 2025 04:29:37 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c05dffd3bbsm137289185a.45.2025.02.10.04.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:29:37 -0800 (PST)
Date: Mon, 10 Feb 2025 20:29:31 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, Haylen Chu <heylenay@outlook.com>, 
	linux-arm-kernel@lists.infradead.org, Sebastian Reichel <sre@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 08/10] riscv/arm64: dts: cv18xx: Add sysctl and reset
 nodes
Message-ID: <mcixunylnco2obzrvqn4emaq3vey2zvkdggybymrm276bcgrsi@ck3nta7w576s>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
 <20250209220646.1090868-9-alexander.sverdlin@gmail.com>
 <h73zitljaig7nrccd3f23i655imswv54tf667dhq3dord7rxsr@unqncqlorvc6>
 <e17ef70f7536bd1bf0b4d0f7258f91cffac76a20.camel@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e17ef70f7536bd1bf0b4d0f7258f91cffac76a20.camel@gmail.com>

On Mon, Feb 10, 2025 at 12:47:59PM +0100, Alexander Sverdlin wrote:
> Thanks for quick feedback Inochi!
> 
> On Mon, 2025-02-10 at 13:13 +0800, Inochi Amaoto wrote:
> > On Sun, Feb 09, 2025 at 11:06:33PM +0100, Alexander Sverdlin wrote:
> > > Add reset controller node and required sysctl nodes.
> > > 
> > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > > ---
> > >   arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi | 16 ++++++++++++++++
> > >   1 file changed, 16 insertions(+)
> > > 
> > > diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
> > > index 53834b0658b2..d793b6db4ed1 100644
> > > --- a/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
> > > +++ b/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
> > > @@ -309,5 +309,21 @@ dmac: dma-controller@4330000 {
> > >   			snps,data-width = <4>;
> > >   			status = "disabled";
> > >   		};
> > > +
> > 
> > > +		rtcsys_ctrl: syscon@5025000 {
> > > +			compatible = "sophgo,cv1800-rtcsys-ctrl", "syscon";
> > > +			reg = <0x05025000 0x1000>;
> > > +		};
> > > +
> > > +		rtcsys_core: syscon@5026000 {
> > > +			compatible = "sophgo,cv1800-rtcsys-core", "syscon";
> > > +			reg = <0x05026000 0x1000>;
> > > +		};
> > > +
> > > +		soc-reset {
> > > +			compatible = "sophgo,cv1800-reset";
> > > +			sophgo,rtcsys-ctrl = <&rtcsys_ctrl>;
> > > +			sophgo,rtcsys-core = <&rtcsys_core>;
> > > +		};
> > 
> > I think these node is not suitable for riscv. It should use SBI SRST
> > extension to restart.
> 
> Independent from the particular form, or its correctness, this is still HW
> description, right? It would be a "policy" for the kernel configuration, if
> the particular build would rely on the FW or a kernel driver to reboot.
> 
> In other words, the HW block remains in place, no matter if it's controlled
> by a kernel module or a FW. What the point in hiding it from the RiscV part
> of DT, keeping on ARM64 side only?
> 

Yeah, I have make a mistake, the device is needed. SBI need these
device definition to handle some power event.

Regards,
Inochi
