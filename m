Return-Path: <SRS0=WxAw=DD=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5AEEB64DC
	for <soc@archiver.kernel.org>; Mon, 17 Jul 2023 07:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0FF8C433C9; Mon, 17 Jul 2023 07:51:37 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3FA55C433CB
	for <soc@kernel.org>; Mon, 17 Jul 2023 07:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3FA55C433CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-51e5e4c6026so5899479a12.0
        for <soc@kernel.org>; Mon, 17 Jul 2023 00:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689580294; x=1692172294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uvg71QsN0uCFu9CbEe1Sgbll38wTsgcP92il4EjQ13Q=;
        b=afUDFnWslzRUMlvGsAyM5A/z8Bgtlq808C4XiCAFTBhDVGlcc1DArSGKnmTN18sx3r
         VdlQb7AHdvUMrbi/Uwwk0d1yLXJRa6NbD4LK0CW/kuR64GlgSMBp635g69iIEFyAza8r
         5TihJlZ37HbgiCIToe5/KsXb8leVQ5cvE1LPhPLYVSmL6aHHykf2G5sMW/hhyBf369d6
         gZzA4Q3O8kl3EWM7Shkp+smySIQDaWIdP6qWFbjMvOEiAblXtD0MTc++C7Cl7xs2EMsn
         2fUIRUfXW7fWLePSK3kWZ+8NTVP3nh+epbxz8zqqRV21SdlZfgKNF9mU0gFU6ahbmcAH
         4P8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689580294; x=1692172294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uvg71QsN0uCFu9CbEe1Sgbll38wTsgcP92il4EjQ13Q=;
        b=gvBPH3JS3TQpdEI3PvD1j2gjdNqjlNu7feD/ppeWS0z8+tTrtKi5Jnn21M7eh3zy+8
         5K+KjxGfO7F8vMRIuNwWUh2Fe15ae5SMfeYtjEbY/XJ4t0xMlhxUghDS2vDf3GkJVfVD
         dnXF44Ek3QyAETpXuvyM83Mo0II6CmXZEkUOpVmNF+5KxEEFhXsLBA7f9LAdlrM5wABL
         SgRzlc8Hn/4pcCBVareyAGH48BGC/GVFBbqIysvBP/RkawDosTkiYWcBQR1ytHOH6o0T
         Lzw2fNkEdbO3OnpcW0lgz3aq6lnPpayYb8SL5fQkLuS7cBUZrgZ5Zxqbck/PjZdZlRQp
         Nn3Q==
X-Gm-Message-State: ABy/qLZ//QH7zl5/m7vxBQUdx/MYDRJaxrkNUMhDkHX8ClOk7DBjt3yg
	GGF8M7PX1+UHqTUERD3tRCsYHg==
X-Google-Smtp-Source: APBJJlHmmTlSB2Ghvbk6jeJZtE3VwyqV0OVfQcEjYy7JfCuFCYa6mTUTHJIFKKAjd+BkT2SKHTXiaQ==
X-Received: by 2002:a17:906:2096:b0:992:630f:98b6 with SMTP id 22-20020a170906209600b00992630f98b6mr10600981ejq.37.1689580294094;
        Mon, 17 Jul 2023 00:51:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id u11-20020a1709063b8b00b0098e4aef0791sm8863674ejf.66.2023.07.17.00.51.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 00:51:33 -0700 (PDT)
Message-ID: <4963b85c-c0ff-92a1-e5d6-ca76f1882f93@linaro.org>
Date: Mon, 17 Jul 2023 09:51:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] Documentation/process: maintainer-soc: add clean
 platforms profile
Content-Language: en-US
To: dsterba@suse.cz
List-Id: <soc.lore.kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alim Akhtar <alim.akhtar@samsung.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Nishanth Menon <nm@ti.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20230714084725.27847-1-krzysztof.kozlowski@linaro.org>
 <20230714084725.27847-2-krzysztof.kozlowski@linaro.org>
 <20230714135914.GI20457@twin.jikos.cz>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230714135914.GI20457@twin.jikos.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/07/2023 15:59, David Sterba wrote:
> On Fri, Jul 14, 2023 at 10:47:24AM +0200, Krzysztof Kozlowski wrote:
>> +Overview
>> +--------
>> +
>> +SoC platforms or subarchitectures follow all the rules from
>> +Documentation/process/maintainer-soc.rst.  However platforms referencing this
> 
> Just a drive by comment, references to highly relevant documents should
> be clickable, so :doc:`Documentation/process/maintainer-soc` , with
> exceptions like if the document has been referenced already.

Is it needed though? The link is anyway detected by sphinx.

Best regards,
Krzysztof

