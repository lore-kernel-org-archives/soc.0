Return-Path: <SRS0=gdDO=72=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0C7C76196
	for <soc@archiver.kernel.org>; Mon,  3 Apr 2023 18:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6CC35C433EF; Mon,  3 Apr 2023 18:36:46 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7687CC433D2
	for <soc@kernel.org>; Mon,  3 Apr 2023 18:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7687CC433D2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-17683b570b8so31791789fac.13
        for <soc@kernel.org>; Mon, 03 Apr 2023 11:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680547004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIk+N2IXSsJAoY2e0gzvK6ymWE6vQVlOd434dzmo7vc=;
        b=m+XDioODRk53s8nsD3ZYUyat5CKH7vAOL4+H+uCHTTRpkr+1+PkA19ZbF55LEN9G3b
         VXUBilDZVweIuw8AL7CPwqMRUIZhiM/SSag7IzQplT2z+kyHZQr384BZvYTkYA1nmhRu
         nmwMU54F5PsV4JtX2MO3k4blHMjxYIh3AAEHdG6O+nNtyXtGi6YT9nwO05t65Ij5Nlwb
         xuedTP2TCe0y8So+njFADyx5eUK8zpsvYIHmoHZlOcptawpFNj3YU/hTCVWkxIjCq8XJ
         KgpjNjpcU61xLOGLx5Kuh0OP5h2YD9hpw7UYsvmShYmH/iv79TwJX3G1kmAvRNqO8Om+
         YaQg==
X-Gm-Message-State: AAQBX9fZ8DMPVXKxdjEZ8Qnfemsm9DZd1Odeo7aE1+ULZ+UdmJZWKqOG
	EpZl9zzjHCZc2XZR27vopw==
X-Google-Smtp-Source: AKy350ZUlFhjgnglIoYafXPoxlDOutQn4rOsAma6LUGjUwvFzwRX7OlCEgbyqHLMXYRz6fgk9hhxRA==
X-Received: by 2002:a05:6870:1707:b0:17e:3772:bdd7 with SMTP id h7-20020a056870170700b0017e3772bdd7mr90499oae.46.1680547004506;
        Mon, 03 Apr 2023 11:36:44 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id xf19-20020a056870cf1300b001724742cfcesm3759713oab.38.2023.04.03.11.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 11:36:44 -0700 (PDT)
Received: (nullmailer pid 1340936 invoked by uid 1000);
	Mon, 03 Apr 2023 18:36:43 -0000
Date: Mon, 3 Apr 2023 13:36:43 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-oxnas@groups.io, Linus Walleij <linus.walleij@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RFC v2 0/4] ARM: oxnas support removal
Message-ID: <20230403183643.GA1335487-robh@kernel.org>
References: <20230331-topic-oxnas-upstream-remove-v2-0-e51078376f08@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v2-0-e51078376f08@linaro.org>

On Mon, Apr 03, 2023 at 09:42:17AM +0200, Neil Armstrong wrote:
> With [1] removing MPCore SMP support, this makes the OX820 barely usable,
> associated with a clear lack of maintainance, development and migration to
> dt-schema it's clear that Linux support for OX810 and OX820 should be removed.
> 
> In addition, the OX810 hasn't been booted for years and isn't even present
> in an ARM config file.
> 
> For the OX820, lack of USB and SATA support makes the platform not usable
> in the current Linux support and relies on off-tree drivers hacked from the
> vendor (defunct for years) sources.
> 
> The last users are in the OpenWRT distribution, and today's removal means
> support will still be in stable 6.1 LTS kernel until end of 2026.
> 
> If someone wants to take over the development even with lack of SMP, I'll
> be happy to hand off maintainance.
> 
> The plan is to apply the first 4 patches first, then the drivers
> followed by bindings. Finally the MAINTAINANCE entry can be removed.
> 
> I'm not sure about the process of bindings removal, but perhaps the bindings
> should be marked as deprecated first then removed later on ?

Nah, just remove them. Like the code, we can always bring them back if 
needed.

Rob
