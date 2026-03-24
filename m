Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C758A36F40D
	for <soc@lists.linux.dev>; Tue, 24 Mar 2026 13:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359280; cv=none; b=KkCwDR8CkgvsaCkpfVlXn9ZZ3dJEtDaM/Ir8fZE3blupkAD4GUym6jq3SZOroHDEhfksSmVj+TwGGV/ZHCMFmcDmE7nmpymXObkCx5AkNhBzMJOYx9gv1iFtdhU/b7E+Ww7K9lZv6LmrMXpmX+X+K7UV2RrLfeNL4b3eyo7tg9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359280; c=relaxed/simple;
	bh=Ydl90mdBaMZbcLqO4exUiw7RWgcNaF0oWnbQlH1GFPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJR25BgcaVxpiUaoeqYT1eFpQiqYFnTLbb3LGDboah2NfnciVuz/aAXwZrdOWYWXnFWfQxJF65tjoixMx1TyDxMx01s73FY95yVX65vtEX7dgevMOc3ECG1F03CRMinyVjkn3Lt+GQQYgA7G3wDsXO0Z82B0rj4QY7OUdBP24tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jeMDoI7f; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jeMDoI7f"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b0abdde280so4005925ad.1
        for <soc@lists.linux.dev>; Tue, 24 Mar 2026 06:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774359278; x=1774964078; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0DRTw1k/Deyd3qw7jRPAvPgHwcdUHnkDo3iNQs7+2Vs=;
        b=jeMDoI7fg5KP728I2cTpJ2fqjo7BGftSBzuGW2Nr/mlPxS3khE5l+k3DxqzY4XwixG
         NufETO2VFWCUshNf/O7KUQTJzffwLy+N43z3cMirh3eRuXPIjgx+aJa5fwDaGCXgvYkV
         TLALRr19EGk214YvYs64zYSb9NfSXXcVWwoT+Xf29wleive66rM1Xk+YmlV93aAIGOcZ
         3KiIU87/o5Rg1fZ5Mjv9vu8Zaq9eKUIgR3Chv9987iJLyWpJfM6GS6NMzQVIEn8b5pWt
         ufPt/G303b/sk6ktsnsc1g74K6YVAnxJpDCVoVkwTy43hZ0DrQCtVAoW50y7LqSB0e5n
         VxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359278; x=1774964078;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0DRTw1k/Deyd3qw7jRPAvPgHwcdUHnkDo3iNQs7+2Vs=;
        b=L/SQEL0whPLcbxfa2mtVHjL+u92qN96NS+/U8cXJSrxpQPrsDB6ilQekIms09vP+WA
         IDeb7G1X4CYAU16PM7e5EESmkx7Bu7iblwSCAwz7tte1uE78YL1d7Su+5tG+8bgXe1y/
         vardLishANf4Nn1VV/08tDwvznzz4gLOU4JDE+WDz+R5fZ1kcR8b73PsoYG/lfi06zqd
         8rsYLTisOopJgjZwrjQYVIwzymzyzzebibk0eI6kZNHHfQhixsoU0l7jnqMnuxjXkB5G
         vxOAQIiWnL/8kYWrWbhXHSmvDrOfdnVqiy7D4PUsLxTsThfwY2AYORDJvPAZmSVuSw2k
         5ARQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFlaFY4/Q91hjSz/m+Y5+gIaprpV8Cc4TxqftYf/bHB4nWRh47zrpiFB30KUeJpzVJU6g=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3sqY11vamequQXmLk8TSr3iCRliIz73jPpITEL04Q/1jMg3Ju
	02ViuubTKA3MqckYBpmO6CFEwf4eMkI3Ccq2hqPuSwQEZhrFVutfjAf+
X-Gm-Gg: ATEYQzzNB2QN9GEUkECmLlAMHpDZ96/PF8kf8rXHbcs4h/K4DP7jwTBnskl/VfGIHeb
	OD6MDRZ8HQVXPG6opOYgZ1tkKjmEC81npekNPWAeP4ddUfTAPM2iF1A4YBDhoXjpCGSi4Iut9MR
	cFYelw5x1oVp5KNAU8Fq5xERaMZwyYN/Jvf9cfpIIBNulex1wDHiA8tfe1yfJYz5RlQ+Cys7QdO
	J3EDi8iggl8TKxvFLmRuOC7EwBVdHxDZIHBqpdZBLe8c5MX6TS7YuAHIc8m5LR1pJPkWR8cdGfQ
	IDiA/QZurhzzkuWHonnJiUSgLnRX0vlKrkS0C5IgDoLIXMR1d+O4FfzK8cY5VYqF9JUnUAkcgpg
	2Dwqv7ljpwxifXe65OPZ+2p9VdjdUJ8mt2vXWfGgsrkSBMavWz9bdbCIHEDCBVrb2sNKHyahnsl
	4/3N9bAQOUQOqh+VHPlbYc6g0BRaUd6ZT9bDYSKTCNW0reQLbW/UPN4ackaPU=
X-Received: by 2002:a17:902:ce82:b0:2ae:47c9:68b9 with SMTP id d9443c01a7336-2b0827ea2edmr157633805ad.49.1774359277914;
        Tue, 24 Mar 2026 06:34:37 -0700 (PDT)
Received: from localhost ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366b5besm148426185ad.55.2026.03.24.06.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:34:37 -0700 (PDT)
Date: Tue, 24 Mar 2026 19:04:32 +0530
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
Message-ID: <acKSzjiPNSbcpKrx@toolbx>
References: <20260323133814.14152-1-krishnagopi487@gmail.com>
 <20260323133814.14152-3-krishnagopi487@gmail.com>
 <20260324-smoky-radical-hyrax-1274a9@quoll>
 <cd3400ce-295e-450f-b650-6715142ccbde@nxp.com>
 <5a9f84fe-5827-48e7-8e4e-699cf8ae4776@kernel.org>
 <acKEJrB6vc9wfd1k@toolbx>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acKEJrB6vc9wfd1k@toolbx>

On Tue, Mar 24, 2026 at 07:00:49PM +0530, Gopi Krishna Menon wrote:

> On Tue, Mar 24, 2026 at 11:01:05AM +0100, Krzysztof Kozlowski wrote:
> 
> > On 24/03/2026 11:00, Daniel Baluta wrote:
> > > On 3/24/26 11:26, Krzysztof Kozlowski wrote:
> > >> On Mon, Mar 23, 2026 at 07:08:09PM +0530, Gopi Krishna Menon wrote:
> > >>> Running DTBS checks on st/spear1340-evb.dtb results in the following
> > >>> warning:
> > >>>
> > >>> thermal@e07008c4 (st,thermal-spear1340): Unevaluated properties are not allowed ('thermal_flags' was unexpected)
> > >>>   from schema $id: http://devicetree.org/schemas/thermal/st,thermal-spear1340.yaml
> > >> How is it possible if there is no such file?
> > >>
> > >> Did you just add new warning in patch #1 and then claim in patch #2 that
> > >> you fix it?
> > >>
> > >> You completely miss the point why this change is needed: how could the
> > >> DTS work before? It could not. And that should be your justification for
> > >> the patch, with explanation why it could not work.
> > > 
> > > Correct me if I'm wrong but I think there was a hidden bug here 
> > > 
> > > drivers/thermal/spear_thermal.c:spear_thermal_probe:
> > > 
> > >       if (!np || !of_property_read_u32(np, "st,thermal-flags", &val)) {
> > > »       »       dev_err(&pdev->dev, "Failed: DT Pdata not passed\n");                                                                                                                         
> > > »       »       return -EINVAL;
> > > »       }
> > > 
> > > So, the driver was checking for the correct property as pointed by 
> > 
> > Yes
> > 
> > > 
> > > bindings/thermal/spear-thermal.txt but the dts was using the wrong
> > 
> > No, DTS had two properties - correct one and incorrect.
> > 
> 
> Yup, spear13xx is included by spear1310.dtsi and spear1340.dtsi both of
> which have st,thermal-flags correctly defined. When working on this
> patch, after converting the binding, I ran dtbs check and upon seeing
> dtbs warning immediately fixed it thinking it was complaining because
> st,thermal-flags (thermal_flags) was written incorrectly. (Which is not
> incorrect as st,thermal-flags was there in the final node but there was one

I meant 'incorrect' here not 'not incorrect'

> additional property named thermal_flags as well which is not allowed as
> UnevaluatedProperty is set to false). 
> 
> Also I dont think we have to override the st,thermal-flags property in
> spear1310.dtsi as the flags value is same in spear13xx.dtsi and
> spear1310.dtsi (0x7000).
> 
> > > 
> > > property name: arch/arm/boot/dts/st/spear13xx.dtsi » » » thermal@e07008c4 { » » » » compatible = "st,thermal-spear1340"; » » » » reg = <0xe07008c4 0x4>; » » » » thermal_flags = <0x7000>; » » » }; And because this check is wrong:
> > > 
> > >       if (!np || !of_property_read_u32(np, "st,thermal-flags", &val)) {
> > > 
> > > people really didn't notice it.
> > > 
> > > The check should be:
> > > 
> > >       if (!np || of_property_read_u32(np, "st,thermal-flags", &val)) {
> > > »       »       dev_err(&pdev->dev, "Failed: DT Pdata not passed\n");                                                                                                                         
> > > »       »       return -EINVAL;
> > > »       }
> > > 
> > > So, this actual patch has uncovered a bug! 
> > 
> > Yes. Driver also has bug, so probably was never working. The point is
> > whatever commit is doing, the dtbs_check warning is not the
> > justification, because it was introduced by this patchset.
> > 
> 
> Please correct me if I am wrong Krzysztof but should i send a seperate patch
> fixing the thermal_flags property (Not connected to these converted
> bindings)?.
> 
> Also, is it necessary to set additionalProperties to true? I am not able to
> figure out if that is needed.
> 
> > Best regards,
> > Krzysztof
> 
> Thanks,
> Gopi Krishna Menon
