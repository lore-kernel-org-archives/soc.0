Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6DDC433EF
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 20:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4BC6C341C0; Thu, 16 Jun 2022 20:47:57 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2F98BC341D4
	for <soc@kernel.org>; Thu, 16 Jun 2022 20:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2F98BC341D4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f171.google.com with SMTP id q140so2267945pgq.6
        for <soc@kernel.org>; Thu, 16 Jun 2022 13:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/pVzaOY9CFepK+i9q4fsrNHrN+dhMEmS2oDBirnD9FA=;
        b=sXCLsno8ay84b56C2dm5p3bQETg7M9Pas9KYTGjIuX9Me6fAlskGNeysmgVYem/U3i
         fd2u5FMpZOWmSr3AxUgDn4E17fAmxLCzduV5BPUXsrj60EL91BCWCj+oZAOM8DtC9OKe
         YWkvX2NyTg713VbdFv/pYFYPb07S4dkqq20gLnMKVCzZruwaStST6V1lOI+oqXEitTaj
         AzEAdZII/WPh0SHoBbu5ql8S4STvvXR9xQZzAHrTRy8Qveis6a7jOQ2D+QPEe6QTAa//
         9XIic3Cow9mjPfXICxFLRDGL0XJ1aOP4XFyL7QvzQMocbW0ydzKHgUmReA4HVaOhhQpY
         UUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/pVzaOY9CFepK+i9q4fsrNHrN+dhMEmS2oDBirnD9FA=;
        b=2YQJYI3JshTrBjeSQZPVcWWf4cmyOK21H49inI4pRqijtJl4wFZC0uFmC/g640ED7K
         e+1jx+D98RlDLod1H85ApZ21mwJ3A+rp/0SOrGLBv8ZvAn3PB4f+MpWfQORikovffHz1
         hi19j90iHjsdv6iy4Q6X7t4gXSqMG7uXTkdcQAwzLxp3aRwjNI+Sk+suPAdJeU5X7o0I
         GwZOwpDr5wRL5cmfTdJxxYz/wsv5sdhWOVwobJVKPi7MIafGf4I60wE9PKKzCZ7P5iXL
         bgkrfkY+Ih4mj3PLCnx37MU0o9WQkKMGPYzob2yU6XqxvKojJ4KN4KDuJ5FrBgBaQvNf
         RSrg==
X-Gm-Message-State: AJIora+xmecDwD1oFaeS3231MH3cfWPUvXmTHw59JpkSqEIQHHNm8Fej
	t0cD2HH5qnf/Omi244UTys8nFw==
X-Google-Smtp-Source: AGRyM1ubZjKzAx27pQvmAgugnf7CvSnECablkLbpEMOEjewVkaUyTg3qtr0IuXESsdpX0H6W/VhONg==
X-Received: by 2002:a05:6a00:c88:b0:51c:1001:65f9 with SMTP id a8-20020a056a000c8800b0051c100165f9mr6463419pfv.66.1655412476609;
        Thu, 16 Jun 2022 13:47:56 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id 203-20020a6218d4000000b0051ba0ee30cbsm2165453pfy.128.2022.06.16.13.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 13:47:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: axm: adjust whitespace around '='
Date: Thu, 16 Jun 2022 13:47:17 -0700
Message-Id: <165541242280.9040.11932013052748741725.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204100.831742-1-krzysztof.kozlowski@linaro.org>
References: <20220526204100.831742-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 26 May 2022 22:41:00 +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> 

Applied, thanks!

[1/1] ARM: dts: axm: adjust whitespace around '='
      https://git.kernel.org/krzk/linux/c/06e00a512d0a09760bef10621d4cdefc26777fad

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
