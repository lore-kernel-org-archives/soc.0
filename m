Return-Path: <SRS0=qZpA=7E=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15ACAC6FA99
	for <soc@archiver.kernel.org>; Sun, 12 Mar 2023 17:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A6EF1C433A0; Sun, 12 Mar 2023 17:21:28 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9FB13C433D2
	for <soc@kernel.org>; Sun, 12 Mar 2023 17:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9FB13C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id fd5so5967534edb.7
        for <soc@kernel.org>; Sun, 12 Mar 2023 10:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678641686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ViY92Y/qZQtdNrk3VZO6hJAbD2p0ISzkTrFK58wcFM=;
        b=cgmkoiNGRKV5+QFeySaNDFyOmNlMZtZskI5KsDBE56OFTmDwBPjb/pgEQIuB0Ex6cX
         QitVhDbWjDrN7Xx9qieA9Cf4CTb2IPI11/uMeD0YIS2hnhpuxsbzsIhhPvp7nihx4JYP
         F/M5NX0zpn5ZQ+1HXIq8JsGKYC95LtzmkvpJRluYcJubh++qYrQgfpYymFrz980jaKXm
         3+DkQ+RuLk5cZfBoaMrJSRJwkHEQfxQZnBtVQ+nj6BX0hlbgO9Pe81pgKhr+509GyJ3N
         KaH1cclcJmKI3VlKEjcZgU95dSEeLrUpgjDh/daQOZXTUYIy8EgLwaApZkQ/+G9qhAU+
         qBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678641686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ViY92Y/qZQtdNrk3VZO6hJAbD2p0ISzkTrFK58wcFM=;
        b=GuBrOZg2WUunr5fIxC/YQq1nyNSOIkbUTVDx9EWPyuwypjqgg9W8H5K4h3N8sZ70tw
         XsLwUOvGpPYfbT2W3C8YYZPVrnFPOEf+zfX7rrNGcHUJFARIC5+l/GmaLRxohfrXHC6O
         2EDZp4z+lA4bLDmTqDQRa+1qd9jqxgNUcBIBCT/F2YfQd1ymBC6H6dlmikrVJZiEdjlY
         Hdl4oexFZq5NaxIe6GkXnYJ1cQeTdqFPjsVzelGX8fzelquRDgWcELyjBbqwBH1mQCzd
         kmV+an2hUnefbO1gdlU47VeY6Edx9wxigLWOe4Kguftp8tO9IijvW8QRa/9LKD7E+6rh
         RQpw==
X-Gm-Message-State: AO0yUKX6JarnTmwGZYNHaT3vWYeJ3SmbNW1RomfoksVHkxT7D0epDvdL
	coYwGJo/6PYPB5paIqtrML8oLA==
X-Google-Smtp-Source: AK7set/P6SdCV5OT9AuJH30ut5cgK31LDEIQ7LHmvTALOlbfuf+3vlc4X2fi/LuaBLJBlFKvYx1hpQ==
X-Received: by 2002:a05:6402:613:b0:4fa:7724:a51e with SMTP id n19-20020a056402061300b004fa7724a51emr4708132edv.26.1678641685753;
        Sun, 12 Mar 2023 10:21:25 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id y13-20020a50ce0d000000b004fa380a14e7sm2055395edi.77.2023.03.12.10.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 10:21:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	arm@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 4/5] arm64: dts: toshiba: adjust whitespace around '='
Date: Sun, 12 Mar 2023 18:21:19 +0100
Message-Id: <167864162125.395859.16545103621407700070.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204606.833054-4-krzysztof.kozlowski@linaro.org>
References: <20220526204606.833054-1-krzysztof.kozlowski@linaro.org> <20220526204606.833054-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 26 May 2022 22:46:05 +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> 

Applied, thanks!

[4/5] arm64: dts: toshiba: adjust whitespace around '='
      https://git.kernel.org/krzk/linux-dt/c/8a922b7728a93d837954315c98b84f6b78de0c4f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
