Return-Path: <SRS0=7ELp=DA=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FB7EB64DA
	for <soc@archiver.kernel.org>; Fri, 14 Jul 2023 04:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E5487C433C9; Fri, 14 Jul 2023 04:12:20 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EC38BC433C8
	for <soc@kernel.org>; Fri, 14 Jul 2023 04:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EC38BC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3094910b150so1600409f8f.0
        for <soc@kernel.org>; Thu, 13 Jul 2023 21:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689307938; x=1691899938;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f8CTz13Ju/w9ax8ItZAVN5IBS20v8dpfE5mavSr6QmY=;
        b=d8qAos+3KnkGz93yO8WWHVCCKmxnxkGJKeWhWxHc2Xf0lWJ+2zUVBs2HZFPYhq/2Pm
         4zPX3OgolxCGO1rMqd6s88CbhTvUOVLtmkJOQEsFPl7k0lGsxYnVaXJvROUB0NDjbo3l
         2/o94arb7IgUTDblGtpvp94s9BD8UFCD9+ak0hrLyz3PzaQ2mvVaEk7jJeNC7Yjsqs4d
         GxfZ2oZhhx3TUj2HxkSv0bxAAJySlFXwP5Qa9rJ/Xd/4NtTwoIp6z3ekzp1TMkM8qa6b
         zzrC7qElNpYTiy9Oe6fJVxL+2uEOUqefUOWv/DXabeqQP3kJnrAlKD/B4fI/vz1h8U96
         njYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689307938; x=1691899938;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8CTz13Ju/w9ax8ItZAVN5IBS20v8dpfE5mavSr6QmY=;
        b=elNZB+ZF16lCFRm5n1726o6gvm90GshBCIBWwBmpfz6C8XZms4sh4HEkfEWYAolCgx
         Ok5SfT/08gpMyrvVV8lbDdkKDEBo10HPt2/rAZX2U1nvuGwiA8ug1gbCovP8hgBiig9d
         c9ArZhtVDWo0vOne13yJ6TPeUxlncvt0Aowo+fqe0zKq/bWSuJEQexRLrMgvItiQ4d3I
         2tebtNDXfULQALZKpytUe7seCTb0N+Ag2+KqQ2ognm/6UmH0L+ciRu5E7+bM95ksa8Na
         M1hq+/E34tPR9VpRtBC2BdwkBnJrNvXupUfdHDXIyYcx5MNf5MBPfYtfATVESgVAWso9
         KShw==
X-Gm-Message-State: ABy/qLYG2bOVYbqrwZs+/F10jSTVwVb1gweYI4INmTnd4+Pon/JJies8
	1qqpSyKkGXNwZFvZ8VCEt/PUYw==
X-Google-Smtp-Source: APBJJlEiIEZ5oNA1kHIlijl6CR0KNtgyfSCPe+BnecIDGB/eed9crKM0HAEf5FXJE7lQ0/sQpDohiw==
X-Received: by 2002:a5d:68c6:0:b0:313:f235:cd17 with SMTP id p6-20020a5d68c6000000b00313f235cd17mr3038668wrw.40.1689307938125;
        Thu, 13 Jul 2023 21:12:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id r12-20020a0560001b8c00b003141b9ddab3sm9566447wru.114.2023.07.13.21.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 21:12:17 -0700 (PDT)
Message-ID: <627bcf48-d9fb-5bfc-f45b-f9cf614d081d@linaro.org>
Date: Fri, 14 Jul 2023 06:12:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/2] Add Facebook Yosemite V4 (AST2600) BMC
Content-Language: en-US
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230712073752.54624-3-Delphine_CC_Chiu@wiwynn.com>
 <20230714023502.3225096-1-Delphine_CC_Chiu@wiwynn.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230714023502.3225096-1-Delphine_CC_Chiu@wiwynn.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/07/2023 04:34, Delphine CC Chiu wrote:
> v2 - Add Facebook Yosemite V4 (AST2600) BMC
> 

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets.

Best regards,
Krzysztof

