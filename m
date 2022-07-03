Return-Path: <SRS0=LbBh=XI=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BE7C433EF
	for <soc@archiver.kernel.org>; Sun,  3 Jul 2022 03:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB2B6C341CF; Sun,  3 Jul 2022 03:57:38 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F0AE9C341CA
	for <soc@kernel.org>; Sun,  3 Jul 2022 03:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F0AE9C341CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f179.google.com with SMTP id u9so8876843oiv.12
        for <soc@kernel.org>; Sat, 02 Jul 2022 20:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tKpzejLshB+azhLe9/Pn6K4qRUtHqwv08GiuhB13awQ=;
        b=Vlm2UvMOBU6j+F4uA1uua7xdjcKXAJS16yiVDzjz0fk/TohHw1n3ZuLBFOOgXJnjdL
         cC1/iYipDv61kk1Wx2KIkpaJbPD5MjbHRvNKB3RbT1drthzxeIctUH/pmq/78cCI1G/o
         tezcGUX8sEVS8O7jWRND0vOopeLMPVNIYzKslhsAgScNX65A16mA7o+LnjiMv1T0NoLd
         tSO22rYNQsxjV7ggwlMj+5DTGQIL+LLHdIBKM8CIU1WF+DGZA9Rb6fyIy6dQHFFIrYtw
         4cVpeoZfBJb1BUnGVXxmzqJq6rbq5dM4XK6dHfdm/ja1FPH8buuNbkT+OZLY1/OkBmJG
         Flig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tKpzejLshB+azhLe9/Pn6K4qRUtHqwv08GiuhB13awQ=;
        b=o9ropOBTn3Sl3fEgDyC+58bq7S/akYPIl7qJbGRLBsNia1ASJ8q5ILKLw9hiVYqNJA
         IdB1RO9wHk1lL7HgO1/0WWsES7BZmmw1lCv3JcsRxpNDOAv0SsyP16t5m5/T0BzubdzO
         PUt3ZE53ez56gn6yRdRCT0vfj9tZ58CdIkhz1ALjExxjSeJ/gn7q779VddAKkIewFAe+
         YsM3iiFx9mnCApZaIOpc3TJCWJdckuB++XUD2zDiYMFdeGU/bE4BHAMuYjsF6YKnheOV
         SInvVZzI2Ku1N4+krV5n0eOdCmGB+bsdKBfKg0rXmISXS1RoHdVFWlmE2sAq6aQuJvKU
         m/KA==
X-Gm-Message-State: AJIora8m6zQl9hHGh95Rt1zz2tyikhVw2kv9vHt584aCqWQoefbBC9GZ
	yvbACpTjLsS69aarFutOVA+o2Q==
X-Google-Smtp-Source: AGRyM1sZ9cAQ+ayswgOKAMc3SmLTVs5cQB5R9X2D8VC6DbfvRolsnT9XWG5MpLPLW7XQRPj01oOHcw==
X-Received: by 2002:a05:6808:a89:b0:337:b33f:90d7 with SMTP id q9-20020a0568080a8900b00337b33f90d7mr1577812oij.262.1656820656702;
        Sat, 02 Jul 2022 20:57:36 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:36 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel@vger.kernel.org,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Olof Johansson <olof@lixom.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	soc@kernel.org,
	arm@kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: (subset) [PATCH v3 23/40] arm64: dts: qcom: sdm630-sony-xperia-nile: drop unneeded status from gpio-keys
Date: Sat,  2 Jul 2022 22:56:30 -0500
Message-Id: <165682055968.445910.692492980359330400.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220616005333.18491-23-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-23-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jun 2022 17:53:16 -0700, Krzysztof Kozlowski wrote:
> Nodes do not need explicit status=okay.
> 
> 

Applied, thanks!

[23/40] arm64: dts: qcom: sdm630-sony-xperia-nile: drop unneeded status from gpio-keys
        commit: 9d8840f6ee426b6dfcb65bdf39e2898652e2b1e5

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
