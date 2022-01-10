Return-Path: <SRS0=5PCZ=R2=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EE1C433EF
	for <soc@archiver.kernel.org>; Mon, 10 Jan 2022 20:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F1EC4C36AF2; Mon, 10 Jan 2022 20:53:56 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4A0FEC36AE3;
	Mon, 10 Jan 2022 20:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4A0FEC36AE3
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id c3-20020a9d6c83000000b00590b9c8819aso6908843otr.6;
        Mon, 10 Jan 2022 12:53:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5jViEVNaH5ssihtRUb66g7EwfG1jcOv2MY8O9pmmorg=;
        b=ibebadUH6mRsPD+NTS/02FgY7w+cG5r9gKT7kyDaUeTWQ36lRRWGXxAaLnOpFuejpR
         7EeePKdPlslaEsUDYSAH7te0TuqfIa6QwSOCnWNM6OcoWOMWDg+gawtJvaqcWAs65Nlq
         Pq/G3QHuWKPmS4Z18zkhoCu5GRGTnN/ggQYTGp5cxuK4BMCx6dzG74BTYL1oJSx/QDB0
         AGLgahOgBrgwjXuDVhlPEpyMgK5nwU7ahNvXXiAQW3WDb2Xgm2fAhuSxqj6TPJ9rGTym
         X4JucnzLp+Izoh2nlX12Dq7cD8l7MwSySHLA14Hagd/nDmZqmVAARSOCEyG4MYyMvCyk
         +qgQ==
X-Gm-Message-State: AOAM533vC6p6hWYsrIdjcQA9BTTjfY2jtATsBwIGDHre3uRpose3ru+I
	4fsgXUWJqrSZlacbLkWc7Q==
X-Google-Smtp-Source: ABdhPJxjZ2jynEBItpLqt9NCVitbIruGA6hhf1Cn4rtASR80GBQRgNzOVwIYNjaQXtPgE6AnPKlWyg==
X-Received: by 2002:a05:6830:314b:: with SMTP id c11mr1192713ots.145.1641848035368;
        Mon, 10 Jan 2022 12:53:55 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bc10sm1337791oib.44.2022.01.10.12.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 12:53:54 -0800 (PST)
Received: (nullmailer pid 1489114 invoked by uid 1000);
	Mon, 10 Jan 2022 20:53:52 -0000
Date: Mon, 10 Jan 2022 14:53:52 -0600
From: Rob Herring <robh@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>
List-Id: <soc.lore.kernel.org>
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Arend van Spriel <aspriel@gmail.com>, soc@kernel.org, Chung-hsien Hsu <chung-hsien.hsu@infineon.com>, Kalle Valo <kvalo@kernel.org>, linux-arm-kernel@lists.infradead.org, Franky Lin <franky.lin@broadcom.com>, Chi-hsien Lin <chi-hsien.lin@infineon.com>, linux-wireless@vger.kernel.org, Olof Johansson <olof@lixom.net>, Ray Jui <rjui@broadcom.com>, Wright Feng <wright.feng@infineon.com>, linux-rpi-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Florian Fainelli <f.fainelli@gmail.com>, Phil Elwell <phil@raspberrypi.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, brcm80211-dev-list.pdl@broadcom.com, Hante Meuleman <hante.meuleman@broadcom.com>
Subject: Re: [PATCH RFC 2/4] dt-bindings: arm: bcm2835: Add Raspberry Pi Zero
 2 W
Message-ID: <Ydyc4IwORMPNep4z@robh.at.kernel.org>
References: <1641068812-5851-1-git-send-email-stefan.wahren@i2se.com>
 <1641068812-5851-3-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1641068812-5851-3-git-send-email-stefan.wahren@i2se.com>

On Sat, 01 Jan 2022 21:26:50 +0100, Stefan Wahren wrote:
> Add the Raspberry Pi Zero 2 W to DT schema.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
