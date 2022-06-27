Return-Path: <SRS0=17+H=XC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84737CCA485
	for <soc@archiver.kernel.org>; Mon, 27 Jun 2022 09:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6BE24C3411D; Mon, 27 Jun 2022 09:16:12 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DD99AC341C8
	for <soc@kernel.org>; Mon, 27 Jun 2022 09:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DD99AC341C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id pk21so17812739ejb.2
        for <soc@kernel.org>; Mon, 27 Jun 2022 02:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=r+10y73o1BlNJF4WUvITZIfLalgDbNqsds0+u16dD8k=;
        b=DicwTKV87HX1b2VwlyEDHhg3G92yZFYVbjdox8Ym61HX63HfvQpst/3EoNW6U9xRPM
         4Yu+AJ6Pj40mAVN2l/Ph05zkEhHY1Nv+QxEEAgb85l8DHoUn1bCKx5G4iLJ1Zkv/Olnv
         06VCZOFs9e6LNmQ59XnzgW3CndZyMj4JukJ7+/14QByLaisb1b0PKgYpMv/Pksr1dQ5t
         qArhbUkRWZ48dU8aDy+pBXP8AnwVOtizrcnazgi1+dUUVmgSWXRCO2iAVVHooS0akgVM
         LXhaReUxOugOtGrgvDldNCh5Q04m2HbcfbImD+vIAG0Uv0xWTwjgFsdUWdVyl3HifXXR
         mGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r+10y73o1BlNJF4WUvITZIfLalgDbNqsds0+u16dD8k=;
        b=sUxM4QVMrXWUKqatFQJ/a3wv30P+dDSVSA7G6Vu7VVj8JI8yJb1gTPHalZDfL6YiV6
         fuMACQapBOSAey3Pq0ryxOjqIjJoiu0u196n6o5o4NjHNTINfOIHhjGL46dX1TOHU9hn
         aBSKqhUPn2og3TDUjA1GyytDZjSlE+ZYZIPMY0oaDDpCkp25Fygr7vRxK9dZJk+LApMW
         haZU24RYXFMgBJOOEGqTThOKqEdu7NqlIM99GAaFTbf3gTF+mQmUMuDEa6v0HLltxAh1
         /rnh+kJ6J2zyaaBx9DFeBJdYul3Tar+28Rrh14Zgcuo9WtJvy57pWfaBfktYgZoeEmZV
         RoAQ==
X-Gm-Message-State: AJIora9rburyUR8HwCJk7Z1qpxVZRsZ7IQnj3+Dr3OZR6zKFthfidSmW
	dU31kwiZGHLyrMgQI7BhoYB8l9/pujmGRQ==
X-Google-Smtp-Source: AGRyM1uJKt77ujhXY8C3Qv1IH9qJa1kIEBOAMSFnKXQP0cMKiWlYx0QyySFAR6ZdVoQHLMvpZ8gNSQ==
X-Received: by 2002:a17:906:5d07:b0:722:e1e3:ab6b with SMTP id g7-20020a1709065d0700b00722e1e3ab6bmr12086465ejt.674.1656321371160;
        Mon, 27 Jun 2022 02:16:11 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006f3ef214e2csm4805395ejb.146.2022.06.27.02.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:16:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tony@atomide.com,
	linux-omap@vger.kernel.org,
	eballetbo@gmail.com,
	bcousson@baylibre.com,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	Arnd Bergmann <arnd@arndb.de>,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	arm@kernel.org,
	javier@dowhile0.org,
	robh+dt@kernel.org,
	olof@lixom.net
Subject: Re: [PATCH] ARM: dts: omap: adjust whitespace around '='
Date: Mon, 27 Jun 2022 11:15:46 +0200
Message-Id: <165632135504.81841.12609886451846241256.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204044.831656-1-krzysztof.kozlowski@linaro.org>
References: <20220526204044.831656-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 26 May 2022 22:40:44 +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> 

Applied, thanks!

[1/1] ARM: dts: omap: adjust whitespace around '='
      https://git.kernel.org/krzk/linux/c/eef3af89b6b66ad61df636464ce92f5deabbc4a4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
