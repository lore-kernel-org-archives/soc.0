Return-Path: <SRS0=8gjP=BR=gmail.com=guptarud@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46179C7EE23
	for <soc@archiver.kernel.org>; Sun, 28 May 2023 13:36:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CDFE5C433A1; Sun, 28 May 2023 13:36:42 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D70CC433D2;
	Sun, 28 May 2023 13:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8D70CC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6260a2522d9so10543446d6.3;
        Sun, 28 May 2023 06:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685281000; x=1687873000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2n/WoDLxYIs5byxeZJLkV/uF8fU1oTZ8WCiBG786KWU=;
        b=Ri6l7Zx7Zq5TyRhM1oOvRL6b6/CiRhjnyFwXpUFCKl9dN82foHPdn49IeTDonA+M4z
         9IyzYufFo5m2DJv3Xj6qB55Ixp6cH6iceqSFDts2NNo/GgqJT4SYB2LC1rzr03lezx2s
         C3U+sIIucSQKaxVIG8u2Y4K1xD3M1LJNfYeoW+pDSQ+koTLc+npw7WV7YY0AO+ck4r6s
         zyLg12MI9QNCwrtGnChOV6mHEh7KYrNa1CSQhF2Bo2W3zhtw5M3hRFz9LdPq4FZdzyny
         k/5RpJ8/gTqGr/S+c/nOolxJemNP6Vytr8OsUy6axFIBjSiOzMDM56HcwsoqwNTMIfX3
         4vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685281000; x=1687873000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2n/WoDLxYIs5byxeZJLkV/uF8fU1oTZ8WCiBG786KWU=;
        b=iVTAMRSX9EZLv6LUSIvCpYWAuUDjWiSuoJPS+p3JXwTK+DNV2Iy2RaSqcUaZam6AHX
         zNObMMF2/TTXE/1tKXPFyJ3m2nXUz+B2DMom58D4kyLdFRa52GrhI8FTvAguUbrOXSEO
         YKzpXws1xZz3GJOWKRmmwZdv7uBPDGRzv27Yt7+XKCGB1Q8QNSC/VnmcBYy1PNXZt8N+
         rxO0DB1M92Rjaz7c4THIGMV0SGxEgppYJE98KoGrbymx9+OepiUIn+1fv/53Ns3lX5Tp
         /1ykBrJMGkIEo5soZ/20iJ6bGKVWS557tIoVmJLCXWiTdZH69OIGmfEd1o/inFP1Pf0r
         nFlw==
X-Gm-Message-State: AC+VfDy6vdArqtHxG8rX2+2ONq7XXCtKX2Sf2ULyIRh7XdcJKhiMjb20
	tzXV1co+iGqPlz1nRg2s+m4YPTgUrl8wHQ==
X-Google-Smtp-Source: ACHHUZ6XUZe6ez6PJp2Vl27vedty0Ud/1hhdxDFc5ChSTJOKCw/jzUz5Qav5ZBXkf80FRvXpjxUbeA==
X-Received: by 2002:a05:6214:500c:b0:626:1589:68e4 with SMTP id jo12-20020a056214500c00b00626158968e4mr4422550qvb.43.1685280999942;
        Sun, 28 May 2023 06:36:39 -0700 (PDT)
Received: from ?IPV6:2600:4040:2007:9800:ffda:b634:1d9d:77a8? ([2600:4040:2007:9800:ffda:b634:1d9d:77a8])
        by smtp.gmail.com with ESMTPSA id k15-20020ad4450f000000b006260e7361ebsm1661935qvu.1.2023.05.28.06.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 May 2023 06:36:39 -0700 (PDT)
Message-ID: <ad7a6ee3-cabb-6f92-a595-8791801cfe97@gmail.com>
Date: Sun, 28 May 2023 09:36:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: qcom: Add Samsung Galaxy Express
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230527040905.stmnoshkdqgiaex6@ripper>
 <20230528001010.47868-2-guptarud@gmail.com>
 <20230528-decode-creasing-f5b3996163e5@spud>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <20230528-decode-creasing-f5b3996163e5@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

 > Where did the "att" come from in the compatible. Is this some carrier 
specific model of the phone?

This is the code name for the device. Since there are usually multiple 
variants of a device, using the code name differentiates between those 
variants. For example, if I left this as "samsung,express", it would be 
unclear if I am referring to the GT-I8730 (code name: expresslte) or the 
SGH-I437 model. This is typically done in postmarketOS: 
https://wiki.postmarketos.org/wiki/Devices and XDA developers. I believe 
it is a carrier specific model of the Samsung Galaxy Express.

