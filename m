Return-Path: <SRS0=LbBh=XI=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21394C43334
	for <soc@archiver.kernel.org>; Sun,  3 Jul 2022 03:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0AEC3C341CA; Sun,  3 Jul 2022 03:57:39 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 266B5C341D0
	for <soc@kernel.org>; Sun,  3 Jul 2022 03:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 266B5C341D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-101b4f9e825so8839298fac.5
        for <soc@kernel.org>; Sat, 02 Jul 2022 20:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2k/Fgz9AophWhcoIr519sZ69V4V1BiY/dYo09eq3joA=;
        b=En+hg1z5WrvULu1uNEZ6rtyfbDF/DZBOhfhOoSNIScEr8zQk0H0P76GLf2rTeqUwcg
         o0wftojb56p14cwueNRBf6CoqF9X6zN6Yc1hoUolKyYxDKB6mYvrOG/BCsCd07Z7MCcq
         7iEzIFnSbAP1dOs3Zy4baH7d4C3IDqh10sRND49ZlAqmK2EuPdmxniCWyF0ls4q/x2w7
         mE257gI77Nd1werdzliQ5AS9emjEcnhMdu2tW4euZw991uXNL8gWIu6LKmpFDXMoKs30
         8kUpXQPFJMmEW+DqFj41263/7rRjLSh/3Ytz59IO45/niPzk0mgJidW+1zDwCnFtODCZ
         YT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2k/Fgz9AophWhcoIr519sZ69V4V1BiY/dYo09eq3joA=;
        b=MFkzDx/zOeXMpC/XVJaWgmH8yVSRW56rbNas8W309PhW3qYpd34i0ZYdvHDyqQhoC1
         7nwbtpVA0zHDFZYRQeinGg8wTJUlQE1QzDmFZTB1qZSCDfMCFd884Sp84xfmKyaNW/ff
         qqJQBlAY34mu06Fh4l1hASE0JHpLX52+d0kfPz0EaPc+iJr+0TEWfyJYZeRhiU+k4oek
         DRP2ReMlAozBSfhC9T42tSaJ/f2Jtwgvl5Lrt+GmBgwVaEm121jyQN/tpVyvwhESLjqi
         D/kDKGknjIPcTKLBnm49oVduk6+EbI/yvhddspe7+kfns0taokpLTkX70tTyFMytcQnq
         vxSg==
X-Gm-Message-State: AJIora+fz5GnCMOI+mQ56eqygmwgVUurCjzsce9+FAt0SP44M4LeHBf6
	qHmlSldpqBPwbTwW0Jx7F0fTGw==
X-Google-Smtp-Source: AGRyM1uKpVtgkHXxjyx68+94KRjsKPFxPkGxNK2SdQajmGJ0T+lNpKGyxY37Lp5e/vdYSv8gDzlHTw==
X-Received: by 2002:a05:6870:45a9:b0:10a:9ebc:63ab with SMTP id y41-20020a05687045a900b0010a9ebc63abmr12506689oao.209.1656820657789;
        Sat, 02 Jul 2022 20:57:37 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:37 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel@vger.kernel.org,
	Olof Johansson <olof@lixom.net>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org
Subject: Re: (subset) [PATCH v3 24/40] arm64: dts: qcom: align led node names with dtschema
Date: Sat,  2 Jul 2022 22:56:31 -0500
Message-Id: <165682055969.445910.9416568186177824296.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220616005333.18491-24-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-24-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jun 2022 17:53:17 -0700, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> with 'led'.
> 
> 

Applied, thanks!

[24/40] arm64: dts: qcom: align led node names with dtschema
        commit: 3cfe94d660a8ebc19e78ea0a4781d7e9a1054c65

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
