Return-Path: <SRS0=D/gk=VM=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527A9C433F5
	for <soc@archiver.kernel.org>; Wed,  4 May 2022 17:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 21105C385AF; Wed,  4 May 2022 17:21:28 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7D227C385A4
	for <soc@kernel.org>; Wed,  4 May 2022 17:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7D227C385A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-ed8a3962f8so1846957fac.4
        for <soc@kernel.org>; Wed, 04 May 2022 10:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tlkw9w1COBFGlrfEOEmUj1EqnjghHZ07vJ79BtjifOo=;
        b=m+YUKyfod23OXFRBpqCg4+1iapObamekGkHiEzVU7Lul/qnTAvu7zDVFU3xa801Dc2
         ocJltiKLrpYKnM78r2NZvtsvk0BeOdLmgPk7PJLkIMVQVFMgYHeDMBUoHl8W2ex7gxP4
         pYcGNoJgdGp8ogLIdB+RBnD6oqjAQWT5q9we6gVdjSjT6f7VNR+ZCzGlt1IdPPqw9boD
         FIMf8jSQMIwwvdKBBusZGXTTm40jCnYKeE+FT9nEMctTYkw8EwDjiHfaHzUd5fNudZwK
         6IRIlSmNHgtDCCvA0Z2jHz9IZfI7BW4NWlI+VNz1tnhVXda5n2U0qFXW8Pdm1HGetY7G
         RWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tlkw9w1COBFGlrfEOEmUj1EqnjghHZ07vJ79BtjifOo=;
        b=kiETz60iM6SYt7lJPqTRb0K+mF/JTjgflBTv2aI3bYw5JdOOcj7JbBPr+0m6mKuEuF
         e0Gg7YJlkZbWRJUitxL1NutRdV716DlFgeO8lR3LIXQfogsYrYzHvwyqWFNCA/07bEF+
         0jpMhU0x/6BmndhJtze8fnBLf03ylk0UUhzPlhSvm7EXIp/3xyjJUExnElIUhkURWHz5
         f/nTj7oU8Bb2v/+JdZhbs0s9YquFNR4NMxBMg6+RobAVM0odSuVUTncjIP2I+1wEZ2KO
         58KP76ZPtgR85X1faoqJFssDxHKh2lSbZGxgH2UwXKy4WkIErGTvBp3xjueBuNm8XUob
         PyUQ==
X-Gm-Message-State: AOAM530LR4oTPLhsPIsCEdZZNexYraIySOEfOVTN0p79CQotsXRS8ADl
	l8tYN5qUb726b71PCSmXwLnG4w==
X-Google-Smtp-Source: ABdhPJynAOZr1shQZ1UOcpvXwTWpxit4tHD2dse/1+L32+bYnRcaMWIrrO38klBRBghqjWxW+5whVA==
X-Received: by 2002:a05:6870:a2cd:b0:ed:754:a2c6 with SMTP id w13-20020a056870a2cd00b000ed0754a2c6mr247783oak.270.1651684886531;
        Wed, 04 May 2022 10:21:26 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a7-20020a056870b14700b000ead8b89484sm5785452oal.5.2022.05.04.10.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 10:21:26 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Luca Weiss <luca@z3ntu.xyz>,
	linux-arm-msm@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/3] ARM: dts: msm8974-FP2: We're msm8974pro
Date: Wed,  4 May 2022 12:21:11 -0500
Message-Id: <165168485226.3730817.5587724254002689421.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220421211936.345168-1-luca@z3ntu.xyz>
References: <20220421211936.345168-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 21 Apr 2022 23:19:33 +0200, Luca Weiss wrote:
> Fairphone 2 always uses Snapdragon 801, a.k.a msm8974pro so change the
> include and filename to that.
> 
> 

Applied, thanks!

[1/3] ARM: dts: msm8974-FP2: We're msm8974pro
      commit: 3237f21824165b41ef0bbdd3f784579c931b2a21
[2/3] ARM: dts: msm8974-FP2: Add mmc* aliases
      commit: 9c5537723429b82561087f8eb8179d065355443c
[3/3] ARM: dts: qcom: msm8974: Add missing license headers
      commit: 3912e74c576a56920cde1d5591125cdd5560caae

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
