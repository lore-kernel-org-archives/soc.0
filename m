Return-Path: <SRS0=r9yq=WU=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5A4C43334
	for <soc@archiver.kernel.org>; Mon, 13 Jun 2022 17:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A4A69C3411F; Mon, 13 Jun 2022 17:54:10 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F2F87C3411C;
	Mon, 13 Jun 2022 17:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F2F87C3411C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id f13so4442233qtb.5;
        Mon, 13 Jun 2022 10:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MQ6Gm6rEcKWgPoZvxj3NUFNwBirG2CnGEdL2DutlzIQ=;
        b=joXD2Wtj8NaDaXR+5hJSdoaWOTNyBxtsLmkoFylc/33cizkqdQKRxkzKf0UlQE15bI
         PRppazDhC0xj+Fe3DTGn8ewe8fG68LGzK+KBD2WymPPh/j3bnBzaIH+U+GGL66l/mYfl
         KfVassBVNwh6ezplUxVW5IONWCdB1nF3F3ol0d82gdC/VBSEL2ER7AVQcXgYZOnsvAw7
         rcsUcDX7vEmTBL/Q9Av1o/ma3mLnwZjiRxuueKeOw1xDCp0gN4VluDjxe4+sr7GazoXo
         Bkir+7pgIgzWMzLymH5/p1naiiJRcJZQWIjygscbj0eDMlS7WFd5EPbZQzvR1IDiY8Y7
         GnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MQ6Gm6rEcKWgPoZvxj3NUFNwBirG2CnGEdL2DutlzIQ=;
        b=VHma9rWKHF/OQ+yZeGzgWuzWk/e3GhOQExJGWZSI22X0lnb5kBGc7TvPx7Ig53ju17
         wcAVlhJ0IEFS3nzAcdV5FHasdxOrNniOCS7mRKyDtHhZEyUxxgYjxoD3OCzCwF6njw16
         wcjEW3iZN0wJXNwIYRuBRNexSsAo2VNaXq/zVh+6NGtbt006vEwAtF+kVIUmpH3f/AWu
         72p3QeIenfljYxVXKIle5YauLSUDQJyv8X+ewvenw+EokfXT89XRbfrBWjKCR2yKckq0
         7Caac4EQ7tlteyumpcnCotukeZbA/jweI4yPuG3nB9GUBwo167QTfXE7xvOeQo8KXOrm
         judA==
X-Gm-Message-State: AOAM5313ilgr6vsfikCsXp9D5EsYh8EDss8Kn3QPwOfgpHHz3tdG15aI
	wa4MCIRO/znCHh8NqNle3Us=
X-Google-Smtp-Source: ABdhPJx0sAHi+4PMHwNszPdJysQo5Oh8DBgyF1D4IUtP45fNmpWG58yU8cVLYzW6xN4NldgDgnPlkw==
X-Received: by 2002:a05:622a:287:b0:305:150:a73d with SMTP id z7-20020a05622a028700b003050150a73dmr834462qtw.570.1655142848901;
        Mon, 13 Jun 2022 10:54:08 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id o18-20020a05620a2a1200b006a370031c3esm7400298qkp.106.2022.06.13.10.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 10:54:08 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: bcm-kernel-feedback-list@broadcom.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/48] ARM: dts: broadcom: align gpio-key node names with dtschema
Date: Mon, 13 Jun 2022 10:54:05 -0700
Message-Id: <20220613175405.244712-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609113938.380466-2-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org> <20220609113938.380466-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu,  9 Jun 2022 13:39:30 +0200, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
