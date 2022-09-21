Return-Path: <SRS0=vXQJ=ZY=gmail.com=aladyshev22@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4902CC32771
	for <soc@archiver.kernel.org>; Wed, 21 Sep 2022 21:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08B62C433D7; Wed, 21 Sep 2022 21:10:04 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 108ACC433D6;
	Wed, 21 Sep 2022 21:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 108ACC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id k10so11336867lfm.4;
        Wed, 21 Sep 2022 14:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=RfoS4oNSl3iLm9QkSJWnFYEHwL243tVfavoKrg1T0Yk=;
        b=ZLrVi3gkesY3f5rBqcgro6CMPhda3lfN+tvhwrlra74SdGidbOb0IITpJNFdVxHbRb
         cr0T/Ak7pmh8hciLZteZ2Vd43eXLDC8YRxUPH/N39duj/2dSq2o4JIh22IaouWxO645z
         tOJjARv599o/6owL6+Aj63mtYNX9znFnl3StMvONNzu/LDdLwIkuQbiEul7ngFFagYuP
         lP9vGPA4YzjDzdv4KFhWEZrq1TUwuPHQLI6rxVMaVhT6AyIcpQvdS457nyZgXb7+3b8g
         rKdV4tgVlTACzKmD+sBTC0z3NyLqCJp4aotEjnfvLZ5kHSXSaJyA7fbrMAkMBmVgJT8/
         zvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=RfoS4oNSl3iLm9QkSJWnFYEHwL243tVfavoKrg1T0Yk=;
        b=u5KREQEjtPKLHWHO8D5YiLrNeRE7rl/fxCn4KQy8FfKEYvbvgRvBJQYzLhDpYRTJoH
         f1OBxsTH1Gw1g03FILoi8+j7RSVRqZ25/O4S8npe8I9VxqKxWAmEj4Iuv9B8whn8Uh+2
         0Gjn5tGglJ9Z+WZPtMgpo+rx0xf0RHTS135XlswNjhK6NjZ5lRj3AYkt17tssXzEwQje
         b3TAwTA4z8inh3+OB10ZMt38kH25FMbzwqz5vcdw5V0Ivf/Xh5Ga1lWrn8KTPiHAq1B7
         O5h/+Xj+6aW638qJO/tj6gzDqK+ntYbL5VPrpPs+/JubglbBiSJXDTIc3PvcRNfYIdGD
         ofRQ==
X-Gm-Message-State: ACrzQf0RrTCH6xr1968UpPZQ/05DkKuuUXx6bYggvw/WBsz+iEol+4Jo
	Cpf/lKmr9uTncpjLuwqIsEk=
X-Google-Smtp-Source: AMsMyM5Ki08t3TG6Pk2qQd8w4vkm6laOpa8ltLFD+v+d+zb9XxFVHDhHFN5aPkWp8FaP1wpeOj82Pg==
X-Received: by 2002:a19:4315:0:b0:497:7488:7a76 with SMTP id q21-20020a194315000000b0049774887a76mr12056lfa.286.1663794601048;
        Wed, 21 Sep 2022 14:10:01 -0700 (PDT)
Received: from DESKTOP-GSFPEC9.localdomain (broadband-46-242-10-176.ip.moscow.rt.ru. [46.242.10.176])
        by smtp.gmail.com with ESMTPSA id z18-20020a19f712000000b0049adbc24b99sm599260lfe.24.2022.09.21.14.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 14:10:00 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Konstantin Aladyshev <aladyshev22@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH v4 0/2] Add AMD DaytonaX BMC
Date: Thu, 22 Sep 2022 00:09:45 +0300
Message-Id: <20220921210950.10568-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920165404.14099-1-aladyshev22@gmail.com>
References: <20220920165404.14099-1-aladyshev22@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial version of device tree for the BMC in the AMD DaytonaX
platform.

AMD DaytonaX platform is a customer reference board (CRB) with an
Aspeed ast2500 BMC manufactured by AMD.

Konstantin Aladyshev (2):
  dt-bindings: arm: aspeed: document AMD DaytonaX
  ARM: dts: aspeed: Add AMD DaytonaX BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts | 319 ++++++++++++++++++
 3 files changed, 321 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts

-- 
2.25.1

