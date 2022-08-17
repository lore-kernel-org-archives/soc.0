Return-Path: <SRS0=zmPw=YV=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EA1C25B08
	for <soc@archiver.kernel.org>; Wed, 17 Aug 2022 07:46:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BEB21C433B5; Wed, 17 Aug 2022 07:46:34 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DFB60C433D6
	for <soc@kernel.org>; Wed, 17 Aug 2022 07:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DFB60C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id w15so12804235ljw.1
        for <soc@kernel.org>; Wed, 17 Aug 2022 00:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=6BuNS9KqOjvtc7XbSSlIG6uXhAeWvKuL+ywpXemmpt4=;
        b=NEIEFh84FTjEE3hoQnBHGsHnaml+UzRG01ulZUBdBSPLfmtu9cAh9yB3kLXEb7LJeE
         yN0LDW4bsQPRBtJ3VdL5/mNd8P1D9WPPFwsiUq6PHZNEEBcc2cj2FMGm+AdQf6j/X0Pq
         br/nZF42BY83RTe61zGApXTy8rFTrDP3Vq4N781RggEjZZIlKg2tV9LTlsMIYdgeyVXY
         djq7euigLcDRRwW/Sze5J6+Ez4khEzp4dfQeDzZDK6eHwymbd83ILn/6dNQIsYxEv/Qv
         LPwZ7gLsUWhcYjq+ljDrIRDVlJsEj8acd5WDj1tx024HECd3+5RmVRH935EPwTvT/jLe
         9TVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=6BuNS9KqOjvtc7XbSSlIG6uXhAeWvKuL+ywpXemmpt4=;
        b=EMJ4htVPPTzgiHOOv0g3AXT3nsZ90G27/ysI1/c+V3GbTylOYEMXMC67vyNUhzdBEW
         7e6lWPHpva+prR/XVA2qwu5O5Q+96ZLo6t5bFkdr3VbBzC95+1CCJ1Poln1ItLvl3CSI
         j3lOFrt7yQttceDJc+XzLUvQpe78FGZTyz/gvMpcczLfdBfMLNRIBJg/hTGxw09P499B
         K3IxJuxLrYuNqugFiPQ3NK2FRXSIqD/X1aljU2LhRznyB4vyBcUJjHzpwx+3k17qi56M
         MW9VUymJ9pXn7n6BAarIwYm5BNnSKQJZdpS9iRc0knXhBELHXBANLBfjVRTiI+OzlQiw
         41yg==
X-Gm-Message-State: ACgBeo2SwFv/0y6DP2LmkrlHRTqH2mIG1eKbbSXwG6koWfBmtHrEbdKQ
	1ffx0lKH0ej0jiuf7esGkPnWbg==
X-Google-Smtp-Source: AA6agR7+bPFR57iuqYAZKnMHO1NMowGeL+VPcAK4pDjgtRZ+eqZjZeD9JBI30m3jn8ov9firTW4gGA==
X-Received: by 2002:a05:651c:4d1:b0:25e:5c72:43f0 with SMTP id e17-20020a05651c04d100b0025e5c7243f0mr7916432lji.164.1660722391873;
        Wed, 17 Aug 2022 00:46:31 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1b1c:14b7:109b:ed76? (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id b25-20020a05651c033900b0025e4ca99066sm2094142ljp.139.2022.08.17.00.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 00:46:31 -0700 (PDT)
Message-ID: <ee117d95-615a-e63b-64c9-c11f89b51123@linaro.org>
Date: Wed, 17 Aug 2022 10:46:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: aspeed: document Ampere
 Mt.Mitchell BMC compatibles
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>, openbmc@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Open Source Submission <patches@amperecomputing.com>
Cc: Phong Vo <phong@os.amperecomputing.com>, thang@os.amperecomputing.com
References: <20220817071539.176110-1-quan@os.amperecomputing.com>
 <20220817071539.176110-2-quan@os.amperecomputing.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220817071539.176110-2-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/08/2022 10:15, Quan Nguyen wrote:
> Document Ampere Mt.Mitchell BMC board compatible.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
