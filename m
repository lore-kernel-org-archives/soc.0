Return-Path: <SRS0=r9yq=WU=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BB3C43334
	for <soc@archiver.kernel.org>; Mon, 13 Jun 2022 17:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77B1CC34114; Mon, 13 Jun 2022 17:16:53 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C8E7FC341C0;
	Mon, 13 Jun 2022 17:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C8E7FC341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id g186so6132896pgc.1;
        Mon, 13 Jun 2022 10:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O89rLS/mzd3GPfJDFSo+5GSTwiN9XZJrpeez4+47ZNI=;
        b=dTicN5xPtrJLyjiW2ipGNV5/G0bUbQRp4VPjegR3FKIX/UnXf6vELBEqOB2StTWq8l
         yoFKDr4cVxkL2cBMyvY5nCvhCRf3/M1xYwh2a/toQ5p7rx04lKaI7x4IDE219i4TcxRz
         Wpo2Q4YVxFGOuvq1DkOG9u2spp0DL/ydJ2114ILpjEEXrgUCcEs2IjVbTpp031mZziK4
         uRvnBZUHO+bTyum3IaiJfJOYhWH8kvfPowx+E0lndAHPYl3Ee6RmK+cSquXqiktqQffV
         Ib8zHi8xQquR95o82D5SL6vk7hCf/nNK0K6w222uMZ9Ulbcr6Xj7u6JiIMQtzpIPu9Rw
         ak+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O89rLS/mzd3GPfJDFSo+5GSTwiN9XZJrpeez4+47ZNI=;
        b=4qop+sGKKv1vbG0nQ71A5kes2+uOlv3/Y7K2ag/v09dz2yy93M31UMEIn2f8EleIz0
         nYKL6+uukug+bis/eN1HRFOcMP0ITggce75C74XBqOPcsKi1cGL0m8IQW5qs7SUUcDeT
         xUers7doORUjxNzH8ajGP+wVgnSCWJDvdDp4RDwEdOODzFLxRYbxRVbow1wOTHs6pA/t
         xrIhir87CjlNnnno4vkENeXVsuC6HdyvSqbWaFi23WY+ZnRnLtWj1+j04Dm+UfaqMMBe
         EuRpnwYLD1JZkyH8iWV0zspU6oQT5+T3SNGI9cPxPCOVqztbhSc8SM5Xlyk1M3yP9KWH
         8k3Q==
X-Gm-Message-State: AOAM532myBGbFvGxa9G+vdejHSI4OQ2HBejafu6Pp5gCz0E2oXXRs+oL
	DnBtN+jdLHhoSuN0BeYL/Jw=
X-Google-Smtp-Source: ABdhPJwYjmVQLwa5hFkOguAl4jGmy3T9AiYxPNPENFbusolkPahsaJq76Yf2Xv7ijvOyIC/2uQkagg==
X-Received: by 2002:a63:2a8d:0:b0:3f9:d9f9:a5c4 with SMTP id q135-20020a632a8d000000b003f9d9f9a5c4mr541520pgq.614.1655140612175;
        Mon, 13 Jun 2022 10:16:52 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id r7-20020aa79627000000b0051bce5dc754sm5621899pfg.194.2022.06.13.10.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 10:16:51 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: bcm-kernel-feedback-list@broadcom.com,
	William Zhang <william.zhang@broadcom.com>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>
List-Id: <soc.lore.kernel.org>
Cc: tomer.yacoby@broadcom.com,
	anand.gore@broadcom.com,
	dan.beygelman@broadcom.com,
	philippe.reynes@softathome.com,
	samyon.furman@broadcom.com,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	soc@kernel.org
Subject: Re: [PATCH 2/3] ARM: dts: Add DTS files for bcmbca SoC BCM6756
Date: Mon, 13 Jun 2022 10:16:50 -0700
Message-Id: <20220613171650.241791-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220608175629.31538-3-william.zhang@broadcom.com>
References: <20220608175629.31538-1-william.zhang@broadcom.com> <20220608175629.31538-3-william.zhang@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed,  8 Jun 2022 10:56:28 -0700, William Zhang <william.zhang@broadcom.com> wrote:
> Add DTS for ARMv7 based broadband SoC BCM6756. bcm6756.dtsi is the SoC
> description DTS header and bcm96756.dts is a simple DTS file for
> Broadcom BCM96756 Reference board that only enable the UART port.
> 
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
