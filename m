Return-Path: <SRS0=YOi0=SC=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA28C433F5
	for <soc@archiver.kernel.org>; Tue, 18 Jan 2022 18:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0E57C340E2; Tue, 18 Jan 2022 18:40:08 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 28ACFC340E0
	for <soc@kernel.org>; Tue, 18 Jan 2022 18:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 28ACFC340E0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9AFF84004C
	for <soc@kernel.org>; Tue, 18 Jan 2022 18:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642531203;
	bh=f+2umpBovoEMQQYdKSu7Hsi6nUQIgy6EPRX6r+n6WEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=gI0kTgF1Vt98cjmP/Mo/+/fFhdfOqDbvartmNnuare2DaxX4mZx3D/CPgYQJMHqtV
	 px3DMSAmiRZgQDtEgskfHRGRk7kGP6jsGF64m//qucOVtAFm7KUWI2q9/bDzzmydNK
	 Pn6WbOvIacNvtSuQWJdaj/ijZj+HbgHYdkuWtE3927QUTFl10jf/LsM1ZAsqJ7R8aH
	 GDONnnaGGWKTXUvLf8ZsYNTrtMcdTwKLzrljjEa8ICPCexvrbisjRrMWR0/U23n6Jt
	 cz9lSd5tAbRnKhYWyySixPrId7SB82FRMXX+MRTEh+YIsr/9M/bI7wso0jPNoo5/vl
	 kFNBiPLUtkRNw==
Received: by mail-ed1-f69.google.com with SMTP id ej6-20020a056402368600b00402b6f12c3fso6427697edb.8
        for <soc@kernel.org>; Tue, 18 Jan 2022 10:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=f+2umpBovoEMQQYdKSu7Hsi6nUQIgy6EPRX6r+n6WEs=;
        b=LItH2wcn2NYLyi0vDqptQ6puK3RpSepsseVht0rscWQxQcnyF98e9ihS60RIrWndcO
         F1fgCJVin/uV99O4CAziwS/VRD//8TxIsncve1EPyOJtSdAn/+rIPrm0bLCgY2qxA/Ar
         sraChfd93xMN2uggyWmiQF+O/BUDHOsjbwXo/hNfq/fin5l+w7GDAVtOpe2y6Qf767zY
         l74wZW24zXXcpnNwyWoXxXBRmHpUZ2szkAGF9dpJcXPINZ1lpMnUTTrvMOksRPcxMJa9
         AjbbaCNHWjf0PrEmX8c/qbXKDx2qhfcR1X+jP6gxnW0Ksl7hxo2+m4/f21HzB1US1rw1
         PQHQ==
X-Gm-Message-State: AOAM530Pf+UDYaMjx0mW6a3oa98MvGOAmH0lNxl8D0KXLWmUsMNQK364
	DLSe86gzfYS7U6+NpnyLInDBSmLyOr2dHvu+GLD2PB8sS3ObGmSLwaMuBQLlMOht91pXVQwRdHL
	9qc2jYOrOKxDRsA9v7lWrSDQ=
X-Received: by 2002:aa7:d617:: with SMTP id c23mr23862872edr.138.1642531202674;
        Tue, 18 Jan 2022 10:40:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyu5aW0XJhnNwSWHFutY369qOWBZxrMpbOix0c2l2pCMT1g//7aoxN//m/dPRbAWK/k8U04RQ==
X-Received: by 2002:aa7:d617:: with SMTP id c23mr23862850edr.138.1642531202508;
        Tue, 18 Jan 2022 10:40:02 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id qw28sm5582890ejc.154.2022.01.18.10.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:40:02 -0800 (PST)
Message-ID: <b1bf4b43-639d-c09c-2fb2-0ac58a6eb858@canonical.com>
Date: Tue, 18 Jan 2022 19:40:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 13/16] dt-bindings: arm: add Tesla FSD ARM SoC
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 olof@lixom.net, arnd@arndb.de, linus.walleij@linaro.org,
 catalin.marinas@arm.com, robh+dt@kernel.org, s.nawrocki@samsung.com,
 linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
 linux-fsd@tesla.com
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150104epcas5p4ac6fdc739d21c7d7eb2e53e469466487@epcas5p4.samsung.com>
 <20220118144851.69537-14-alim.akhtar@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118144851.69537-14-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/01/2022 15:48, Alim Akhtar wrote:
> Add device tree bindings for the Tesla FSD ARM SoC.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  .../devicetree/bindings/arm/tesla.yaml        | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/tesla.yaml
> 

Looks good to me. I'll take it via Samsung-SoC after the merge window
unless there are some comments/discussion.


Best regards,
Krzysztof
