Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556B738C43D
	for <soc@lists.linux.dev>; Tue, 24 Mar 2026 13:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359059; cv=none; b=KZjIe1KCsjVHQmT5njTkLeh0t/+evtyFgL5TCkLzQPrGK1/sq4krlT06Mcsoi79jculW3R7mwENgJKTcXEyJjrvnvJtUoMESq7d9yP9hLSK+YD+5fWdPoKOjI7usAfKG6pqNOphsqnn/1QDouSrtWgA7B2JPerj1znkkqU0ofT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359059; c=relaxed/simple;
	bh=ps5VTXqoSaxRQSODgfzno6Phc/AIFnVXZFcO74FSICw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSr+ytO6arckL9HpJ8nmlelWUXWOA/fkf8Oj1nxs+ofSm7Ybz182keXcptkcNemmHzzszbDaImNAfTb8fk86xbm76JUAgUkgMUtKKReKrlNWfocn/rX2ti4wH3ExZ71uneSee+kq8XWZ2nR0XrxQI1u3ITpnhz0mKjv9MRJCr8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7kI8FCz; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7kI8FCz"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ad4d639db3so17527405ad.0
        for <soc@lists.linux.dev>; Tue, 24 Mar 2026 06:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774359056; x=1774963856; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9iKCvDxPU4e1QcvYZGXsXfBq0hdgl0iM7/+HP8gM9eA=;
        b=F7kI8FCzUI1nWeSUaCRPMTRY2QqNUQDwiOMZ2Kx3JkJz/JiTMcUx1Wn2TL3AdmQtdt
         hDDhF8JKtGJ32rIBK7PQVvnlXQFTENwDCfOLaeuGHQFXM/ZTESW/3KQr1PJmQESuIIRe
         8lM0q4y1/trsZHRZNhaKH/B2I9rLVENNhlICYzCDrlyQKNgaOGCEgUXeANwjdJxJf8Kf
         B/vDzGw+ZvfvrluLiYsreAXw1+3RyssYLH3YoOG/lwRwucT5ABf6A/4OwQz0Bbm3WzQE
         9cSxTtssU0bPmF4eJTDUdjLkBmyRJs5OT7qR7HpN34FqZP049S39IfYJJPU/tpQb15/l
         Bnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359056; x=1774963856;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9iKCvDxPU4e1QcvYZGXsXfBq0hdgl0iM7/+HP8gM9eA=;
        b=paxccge50rxCdvb6QOSCFefD4PbpnTwH39kPVd6VLK+dm3z1sZfz93+gw51CqEgNBm
         BejduLmfUI2H32K/pISIBikydtx0NO1dqWP/xEdRF73Zc1Q7Eh1LP1DQ1m8tpzyLlV9Q
         6NE096g03XB4F+bfVanOx8Jf+PFYpeyOCUPRzWh1NZQhrP9Wl0P00NrS+D8776LJuTFg
         OMP06noPlXo5K5KQOzYYC587JLa9JaPet/mvgtyc4oghv10fAfjr1cglDA92Zds4rMuF
         cedjknvNspLNM8Hamslcn/L9WJLBcXi1hriZwl2yUyrfarSNsidcXf/ni1VV2/+GoPlr
         6wsA==
X-Forwarded-Encrypted: i=1; AJvYcCV5eglE688Sep5WTlnUz/GAwxD8FV3pVkTN0F0r+lvbFmLzcISsWUwjKRCgV6X1kam5vCY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzT/xmoDN5lqaf8VQDHLUPLvwgKwY8+KwI2qD4D0Nq1N6IHNazU
	L9WeeNNigabg05ABc7w/W71rtprzSSP2LQjaU1vVhYLwNHt4HSSDRDSO
X-Gm-Gg: ATEYQzxeSRxThdUyTnzf7UIvNhRM+G6d3BqYlgxonCDua2JZkFuWp3r4440mxAcEixH
	1Zo3ukphynFas88Kl2Sn2sEvPn+eZB/YEuvqfr0TI5tiw8FeVITrH+M586tLnHmzMxSGO9wXXfd
	qCx/T8nfjCM+2ryrMpOvwphF9zUz6Jlgw5qjE3rDJelfAqKLIaWgqbaizB7ofn/MWtaWepZqzJL
	c5MJnTvLdvXtoO9gBM/yIVGFW99yqUQBBIlJeeKQQ0CEh8zVsmxJgnf7b67JTOizAAQt/zpqxsA
	lX6mCN2k00sKILAg5hrglYqQs0/Wgfp2AxFkpWQ7VwHPRCKB712iQIQwAQdI1CbUt5UYm8TMz8M
	2WGDkP27gj2QJvNED6F3/TvZqW4kN23GJs/DJfJceIiQrg8iCRlNOYtk4za3npfE0T8vD67KSmq
	Aj2LGd8RXGKJiwvbg1K5mLE84nN4jambcSDajKU7vGdYYV5U1LAcD/uzWT2N4=
X-Received: by 2002:a17:903:380b:b0:2ae:504c:ae8a with SMTP id d9443c01a7336-2b082724a85mr165419795ad.16.1774359055635;
        Tue, 24 Mar 2026 06:30:55 -0700 (PDT)
Received: from localhost ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a7ffafdsm9821747a12.7.2026.03.24.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:30:54 -0700 (PDT)
Date: Tue, 24 Mar 2026 19:00:49 +0530
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, rafael@kernel.org, 
	daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org, 
	krzk+dt@kernel.org, vireshk@kernel.org, conor+dt@kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, simona.toaca@nxp.com, d-gole@ti.com, 
	m-chawdhry@ti.com
Subject: Re: [PATCH 2/2] ARM: dts: st: spear: fix dtbs warning on spear
 thermal sensor
Message-ID: <acKEJrB6vc9wfd1k@toolbx>
References: <20260323133814.14152-1-krishnagopi487@gmail.com>
 <20260323133814.14152-3-krishnagopi487@gmail.com>
 <20260324-smoky-radical-hyrax-1274a9@quoll>
 <cd3400ce-295e-450f-b650-6715142ccbde@nxp.com>
 <5a9f84fe-5827-48e7-8e4e-699cf8ae4776@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a9f84fe-5827-48e7-8e4e-699cf8ae4776@kernel.org>

On Tue, Mar 24, 2026 at 11:01:05AM +0100, Krzysztof Kozlowski wrote:

> On 24/03/2026 11:00, Daniel Baluta wrote:
> > On 3/24/26 11:26, Krzysztof Kozlowski wrote:
> >> On Mon, Mar 23, 2026 at 07:08:09PM +0530, Gopi Krishna Menon wrote:
> >>> Running DTBS checks on st/spear1340-evb.dtb results in the following
> >>> warning:
> >>>
> >>> thermal@e07008c4 (st,thermal-spear1340): Unevaluated properties are not allowed ('thermal_flags' was unexpected)
> >>>   from schema $id: http://devicetree.org/schemas/thermal/st,thermal-spear1340.yaml
> >> How is it possible if there is no such file?
> >>
> >> Did you just add new warning in patch #1 and then claim in patch #2 that
> >> you fix it?
> >>
> >> You completely miss the point why this change is needed: how could the
> >> DTS work before? It could not. And that should be your justification for
> >> the patch, with explanation why it could not work.
> > 
> > Correct me if I'm wrong but I think there was a hidden bug here 
> > 
> > drivers/thermal/spear_thermal.c:spear_thermal_probe:
> > 
> >       if (!np || !of_property_read_u32(np, "st,thermal-flags", &val)) {
> > »       »       dev_err(&pdev->dev, "Failed: DT Pdata not passed\n");                                                                                                                         
> > »       »       return -EINVAL;
> > »       }
> > 
> > So, the driver was checking for the correct property as pointed by 
> 
> Yes
> 
> > 
> > bindings/thermal/spear-thermal.txt but the dts was using the wrong
> 
> No, DTS had two properties - correct one and incorrect.
> 

Yup, spear13xx is included by spear1310.dtsi and spear1340.dtsi both of
which have st,thermal-flags correctly defined. When working on this
patch, after converting the binding, I ran dtbs check and upon seeing
dtbs warning immediately fixed it thinking it was complaining because
st,thermal-flags (thermal_flags) was written incorrectly. (Which is not
incorrect as st,thermal-flags was there in the final node but there was one
additional property named thermal_flags as well which is not allowed as
UnevaluatedProperty is set to false). 

Also I dont think we have to override the st,thermal-flags property in
spear1310.dtsi as the flags value is same in spear13xx.dtsi and
spear1310.dtsi (0x7000).

> > 
> > property name: arch/arm/boot/dts/st/spear13xx.dtsi » » » thermal@e07008c4 { » » » » compatible = "st,thermal-spear1340"; » » » » reg = <0xe07008c4 0x4>; » » » » thermal_flags = <0x7000>; » » » }; And because this check is wrong:
> > 
> >       if (!np || !of_property_read_u32(np, "st,thermal-flags", &val)) {
> > 
> > people really didn't notice it.
> > 
> > The check should be:
> > 
> >       if (!np || of_property_read_u32(np, "st,thermal-flags", &val)) {
> > »       »       dev_err(&pdev->dev, "Failed: DT Pdata not passed\n");                                                                                                                         
> > »       »       return -EINVAL;
> > »       }
> > 
> > So, this actual patch has uncovered a bug! 
> 
> Yes. Driver also has bug, so probably was never working. The point is
> whatever commit is doing, the dtbs_check warning is not the
> justification, because it was introduced by this patchset.
> 

Please correct me if I am wrong Krzysztof but should i send a seperate patch
fixing the thermal_flags property (Not connected to these converted
bindings)?.

Also, is it necessary to set additionalProperties to true? I am not able to
figure out if that is needed.

> Best regards,
> Krzysztof

Thanks,
Gopi Krishna Menon
