Return-Path: <SRS0=m2II=KB=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F3EBC433ED
	for <soc@archiver.kernel.org>; Thu,  6 May 2021 21:06:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EE8A6613BA; Thu,  6 May 2021 21:06:22 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8D6661177;
	Thu,  6 May 2021 21:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8D6661177
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-oi1-f174.google.com with SMTP id n184so6740460oia.12;
        Thu, 06 May 2021 14:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k/gPMK+Xfg6ep+H6MWsHFEMQ9T2XmEt9xMifTotgLCs=;
        b=pIfZ1Ef1jFaa1gPhtZZKIrHBD/pxEAniT0rn7ogaL3iCw+daU7NyvINpnLF6kAa7Sb
         malTClpujgr/Tw3u3X2I50dk4+KlY+XGah6rSSPPPDEWGvHlTO1amEozxdHnLq6404UD
         T9NMVuna3GNmjK+xCajHC9xy88Tud4/9sct2B8IznWDt4yb04axFumIpHMmklf1RIYvo
         tsQcT7RijLYXtDuf9/DlDeb5linMdOvqdvQDP9rpbvbb/Wac+DnhVICDTch+lniB4GQ4
         O/jMLka1jstbzhLC4pDhvwytoHDpT1VbfAUUOoJHVNRBqdA7e+WGuup4+bob7bofhZ2a
         2kXA==
X-Gm-Message-State: AOAM533n61vn1OReka4OK7hLUaSo4/8fPVoGWls2ubWrE62QWlz7iuvY
	O7ZVJS+R7OGz6HlRa2L7Ig==
X-Google-Smtp-Source: ABdhPJzMN9gjgQY9BEYZiNpCP4xZ48xwWs/pBZ5ttg5f2hhyvx0IaZqFCZa39vj+ke+XsaLqICcQnQ==
X-Received: by 2002:aca:a852:: with SMTP id r79mr12235980oie.21.1620335181875;
        Thu, 06 May 2021 14:06:21 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n13sm728879oop.8.2021.05.06.14.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 14:06:21 -0700 (PDT)
Received: (nullmailer pid 801022 invoked by uid 1000);
	Thu, 06 May 2021 21:06:20 -0000
Date: Thu, 6 May 2021 16:06:20 -0500
From: Rob Herring <robh@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: linux@armlinux.org.uk, khalasa@piap.pl, soc@kernel.org, arnd@arndb.de, robh+dt@kernel.org, kaloz@openwrt.org, linux-arm-kernel@lists.infradead.org, linusw@kernel.org, olof@lixom.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: add vendor prefix for welltech
Message-ID: <20210506210620.GA800993@robh.at.kernel.org>
References: <20210504193457.4008384-1-clabbe@baylibre.com>
 <20210504193457.4008384-4-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504193457.4008384-4-clabbe@baylibre.com>

On Tue, 04 May 2021 19:34:55 +0000, Corentin Labbe wrote:
> Add vendor prefix for Welltech computer Co Ld.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
