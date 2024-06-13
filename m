Return-Path: <SRS0=jTjA=NP=gmail.com=alchark@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCC5C27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 07:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 93562C4AF1A; Thu, 13 Jun 2024 07:41:54 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2FAC6C2BBFC;
	Thu, 13 Jun 2024 07:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2FAC6C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4415e623653so11729471cf.1;
        Thu, 13 Jun 2024 00:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718264512; x=1718869312; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpwMjt4nCXN/KG1OXl7Qh7A5KjxtVryyFzFBi/3Kx/M=;
        b=He6hbTqcsmYsp/E7dN7DalkjyBu8CGg3PBXmbs2K2ftqATfgxiW49IVGlSDUOBL3hr
         fqnKjO42xZlgzOOgmLkmYA0UkDZtJ+RJWvahu4+PJM8bFwVC/7F+8siogu91iw2X2a2v
         A3CQrHWyuw5qjARAhovWfpWyfIIYg07bCr5StbEMgOYCs2an2lzEsKosZkk8NjAU/5qH
         vVknRy5ySVhdeSjlx1TUcrrHu8WGBgJJHQvAJVrKzI9y/XSvn0xaplR9LiadZY1hq44I
         3olFcpHVEIJSkUprtEiXRiX+kjJpcdLwtSBS8XUGshjGqivkPjn/MkYLV09AdrMQEo3q
         T7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718264512; x=1718869312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KpwMjt4nCXN/KG1OXl7Qh7A5KjxtVryyFzFBi/3Kx/M=;
        b=rQkvNEbVejiqIjQYMRLVuC/SPW/fYZMHRkuT3nRoA5x78bfc6s33FJF2m/HVWRIdX0
         uM66TKNjP+zWVk2RImeVdomaGudfbiRmK42Vrz616lqa0ysRZ3gwEr7jCQX+OWV608cq
         5wE6fusElhVwlcZluJQWqDD2bl0HjfPc3E3KTqLlEiKyebJaA9ehd+GQpfmL5HMHO8Sg
         Pn35UzCpa1UoF2SE7Iw1iCJuspsGCrLpdOVnBNTtenIdoWBhHqLmQvuJXZccmfKFXuEn
         Wdoe4vjRHF0D4MJrc+cta3TL8y387UyBD2Ipcl1ejuwEeMKQWZeQvayguaCXDRuypl2o
         iukQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRpT99Dix9CmtpD4o84IxTHTjrl+6sTTwU66lJOGawyH96kXPBdKUFm9NO1Fgx+U5D3+7LbHp4jTWV/84VPOp+y32ddCPj/0EflbANG6w=
X-Gm-Message-State: AOJu0YxzJJinWEeqS1+n/JpGYOpxhayyUur9/PGZX5y4UQ7oN1OZ4HLw
	h8USXVZOPiin0p97m/+74jQ9IxuJr1IKqRw7tDahAnc9Xd0NikY2Y3uM/fYnlPCA+2l1vL3DFQC
	YYckpBSzkhZNQXv0XDD9GMwcahAs=
X-Google-Smtp-Source: AGHT+IHlh9lG4DWb0h5SzfU63myWI8aoNkBvMbiWkRAUgDpI8ka+JreWDIaFfCVjmohIyyrEfVAX0hy0xmzJmUxiD6s=
X-Received: by 2002:ac8:5fc2:0:b0:440:62e1:9a75 with SMTP id
 d75a77b69052e-4417aa1773cmr33502851cf.15.1718264512093; Thu, 13 Jun 2024
 00:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240613064612.8589-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240613064612.8589-1-krzysztof.kozlowski@linaro.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 13 Jun 2024 10:41:39 +0300
Message-ID: <CABjd4Yz9zWPe9nUYhZKMoi1fkSmvOoeT91hCPXjSWfS8fPhynQ@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: ARM: vt8500: add Alexey and Krzysztof as maintainers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, arm@kernel.org, 
	soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Krzysztof!

On Thu, Jun 13, 2024 at 9:46=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The ARM VIA/WonderMedia VT8500 platform became orphaned in
> commit 8f1b7ba55c61 ("MAINTAINERS: ARM/VT8500, remove defunct e-mail")
> and clearly it is on the way out of the kernel.  However few folks send
> patches to it and it is nice to actually take them, till the platform is
> in the kernel.
>
> Alexey Charkov still has VT8500 hardware and plans to work on upstream,
> so add Alexey as the maintainer.  Krzysztof will collect patches.
>
> Extend the maintainer entry to cover also VT8500 DTS.
>
> Cc: Alexey Charkov <alchark@gmail.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Alexey Charkov <alchark@gmail.com>

Best regards,
Alexey
