Return-Path: <SRS0=GD8e=BU=gmail.com=guptarud@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87974C77B7A
	for <soc@archiver.kernel.org>; Wed, 31 May 2023 02:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3F12EC4339B; Wed, 31 May 2023 02:49:11 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2DBB1C433D2;
	Wed, 31 May 2023 02:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2DBB1C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-626195b4909so18080186d6.0;
        Tue, 30 May 2023 19:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685501349; x=1688093349;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6e2j8yrS747eKvqEmOM0dcXUIRaD3dt4RVORVnxHAYs=;
        b=qqoBPw/WY+2FSw0nXRa+1jy91yIpTrEAKJn/AOAlD4lvNgY41wlUGC1SkH33Dr2KYk
         KB7VP94bPoNbN5qG3iVHTh5itAUJ1sVKSajgrsV3iHinQbx20UGDrK4siNz69pSbHY8O
         UmpV9E68jVUyZS2NErYZeeyyN5gz2SYBb5yNReN2Rzt7u6eOp7P7saURYQxdRMN1mFjl
         oadzzPD2eJlK9BS+Wb/VMSQmx3NpgrMhNsYfPRPPny3ZUbmYT2n/5qy0YdcWP/i7B0My
         5LzvvzD2GEfVfpahepLUzKG1+OCrZZR5NzqlrXAxQqSGAEwSNDdzHdLmX+9oVMrGroYQ
         gBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685501349; x=1688093349;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6e2j8yrS747eKvqEmOM0dcXUIRaD3dt4RVORVnxHAYs=;
        b=dlgqKPdeSscMT+7HVfVxHNU6U5kQzYZw4Z0rX14oNIYALYkW/Vxd4jW8XIE2x0+YCk
         e7CUQNnb2kFZCzQUgdvn2lyIMOe3uUWCXg7GvJPIGhltF8sfdp4V4sp5yELFNjUiNOxm
         9wqGNPVPVluNRbt9GkwbYZRhuoOtI+gGkSS33fZyPiIpYaNoo1eDxTtz4ntjxChmPVC2
         bCFLR/j7a9NL5nVzam5ZstvEfQadeYsZGawG5VRKYz1W0W2blR/Q2r9CjFdJpHXuAnaB
         bFdPYudUZwldEgECNVK/zpR6RO3nRCaNXLrVgQCFpS3rwRP/ojsRJoJTyUuRGsF5OWMW
         Pztw==
X-Gm-Message-State: AC+VfDwIpc1vxumZf2CSau6k6WvSVk496cX34/6Xxga9pDxnBm337eFo
	xcp+N1yhKxhvaXCEk313SGc=
X-Google-Smtp-Source: ACHHUZ52Yw/1OjG4IhoiE6fZ7eKnLRhYKO0DIKGAauUkEl9PmXjiQG87Tlv0PJ/4VoneEdbKSvFcUA==
X-Received: by 2002:a05:6214:412:b0:625:9562:f04 with SMTP id z18-20020a056214041200b0062595620f04mr4884729qvx.51.1685501348941;
        Tue, 30 May 2023 19:49:08 -0700 (PDT)
Received: from localhost ([2600:4040:2007:9800:dcb4:7fef:9d6a:e79f])
        by smtp.gmail.com with ESMTPSA id er5-20020a056214190500b006262956aa0dsm1952230qvb.99.2023.05.30.19.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 19:49:08 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 May 2023 22:49:07 -0400
Message-Id: <CT04D1K5GOBT.29Y5DO5HHS57V@Latitude-E6420>
List-Id: <soc.lore.kernel.org>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Andy Gross"
 <agross@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konrad.dybcio@linaro.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Vinod Koul" <vkoul@kernel.org>, "Kishon Vijay
 Abraham I" <kishon@kernel.org>, "Arnd Bergmann" <arnd@arndb.de>, "Olof
 Johansson" <olof@lixom.net>, <soc@kernel.org>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: Add qcom,usb-hs-phy-msm8960
From: "Rudraksha Gupta" <guptarud@gmail.com>
X-Mailer: aerc 0.8.2
References: <20230527040905.stmnoshkdqgiaex6@ripper>
 <20230528001010.47868-3-guptarud@gmail.com>
 <fb65244e-ab3b-c473-57b9-2da80e67be4a@linaro.org>
In-Reply-To: <fb65244e-ab3b-c473-57b9-2da80e67be4a@linaro.org>

On Tue May 30, 2023 at 9:22 AM EDT, Krzysztof Kozlowski wrote:
> On 28/05/2023 02:10, Rudraksha Gupta wrote:
> > Adds qcom,usb-hs-phy-msm8960 compatible
> >=20
>
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching.
>
> Best regards,
> Krzysztof

It seems like "dt-bindings:" is the subject prefix for this file. Would
you like me to use another prefix instead?
