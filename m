Return-Path: <SRS0=YV+F=CH=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D66EB64DA
	for <soc@archiver.kernel.org>; Mon, 19 Jun 2023 08:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F1381C433C0; Mon, 19 Jun 2023 08:03:10 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1BBB9C433C9
	for <soc@kernel.org>; Mon, 19 Jun 2023 08:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1BBB9C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-988a076a7d3so136454366b.3
        for <soc@kernel.org>; Mon, 19 Jun 2023 01:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687161788; x=1689753788;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7MsnoYz0hP2V8CBehrpeQPUT+76r/6pTB7F31k/oTqQ=;
        b=R5lm2JEoN1Dap5ewRuzod70/svJW4Tpp+Jf/ugmj1Yk7OL5KSTGTc2+KLFvXEYZtts
         ByDbXZoZ7c6jDHRXmdIpI2Ml/CJ5/87e+a/DcPAG4qe/3X/dS3mR/WK4HcxKs5G54pUp
         k3US0FIJ7DwVVZDtHqibOsRlTx7HuZTzO5NocTyCsvoO0L2t+Nb4MTpHWCpzfkFAzYLW
         W8fprdmu60ugR/QdbVDPQtR5R20Jvp9cCsX76SdJ2g4o9MfkcRTPivLh64I9A68Mq1Uc
         VXKXFrmYX1ZqL+v+ALMzoK3FotlHqeR19D35Fi1kZwhwCLSy8CvBHZMSKbipZsiKSQif
         KoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687161788; x=1689753788;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7MsnoYz0hP2V8CBehrpeQPUT+76r/6pTB7F31k/oTqQ=;
        b=eGV20WaqTtDRHN03WdnFDx0sipnDowTYEv/VmPfz2ktDjLRwCQbxmoMBPZGHeGQtPw
         qdcXfyBRP7fRV8uLSdgKn6/1OxX/wWIxpoDyXaOQokRCaFjeFUTyeNIvHnTC0ZGXZfZV
         dvi6Q1ZQknMC80oFmzQpLf5+zg+SkG8E5BLuAtJA7Q1vH2EdbST9VEiUQcpFrR0XwPY+
         Dj/puxAfjYN9MxZPrUdP8TrYuhmV0v/v/BvzLyfoOjhzj2OjiU1HDPzXgiJR1N4sXxJc
         KA8OyTGziCi+lj9Mca+jGKKZ9HPmD3KFZXTVD56LNC6b3Y6xg8mpiOPTdc8dO5KtqhVG
         ep6A==
X-Gm-Message-State: AC+VfDzr/l5P9/pFYqK6/mbVCncskw1e6EMNRIjrBqlRxPnK3Ghh5r3s
	IKX218/LaAz26Zl0jQh5B2EOb9HsraZBCMeA8WE=
X-Google-Smtp-Source: ACHHUZ4G6sKfA1qmngTmVTdImZtQIJooHKrYQsNUpw4ekWRnZ6ieoPMK8rs9BRGC1ccyE688NqDM8Q==
X-Received: by 2002:a17:907:31c2:b0:974:c32c:b484 with SMTP id xf2-20020a17090731c200b00974c32cb484mr9045597ejb.72.1687161788200;
        Mon, 19 Jun 2023 01:03:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id q2-20020a170906360200b0096a27dbb5b2sm14113007ejb.209.2023.06.19.01.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 01:03:07 -0700 (PDT)
Message-ID: <68262eba-c9b7-5c3c-acb1-1c651931e959@linaro.org>
Date: Mon, 19 Jun 2023 10:03:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: aspeed: add Inventec
 starscream-bmc
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: =?UTF-8?B?Q2hlbi5QSiDpmbPmn4/ku7sgVEFP?= <Chen.PJ@inventec.com>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 "soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Cc: =?UTF-8?B?WWUuVmljIOiRieWuh+a4hSBUQU8=?= <ye.vic@inventec.com>,
 =?UTF-8?B?SHVhbmcuQWxhbmcg6buD6Iux6YOOIFRBTw==?= <Huang.Alang@inventec.com>
References: <20230619064249.3623-1-chen.pj@inventec.com>
 <2a9e503b-7a5b-3b1e-a912-5d54a23c1ca1@linaro.org>
 <832a9af9c9024ed3b7bee0d36a482837@inventec.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <832a9af9c9024ed3b7bee0d36a482837@inventec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/06/2023 09:47, Chen.PJ 陳柏任 TAO wrote:
> Hi Krzysztof,
> 
> Sorry for brothering you and thanks for your patience.
> 
> I use "git imap send" and can only send two patch separately.
> After your instruction, we setup the smtp server and now send two patch together.
> 
> But it seems still not enough.
> Did you mean we need to combine two patch that modify the document and dts in "one" patch?

No, I meant the second part of my message. The long one, explaining in
details what you should do.

Best regards,
Krzysztof

