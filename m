Return-Path: <SRS0=5Ucw=2E=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47EFC433FE
	for <soc@archiver.kernel.org>; Mon,  3 Oct 2022 11:24:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6EF38C433D7; Mon,  3 Oct 2022 11:24:24 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0D4D3C433D6
	for <soc@kernel.org>; Mon,  3 Oct 2022 11:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0D4D3C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id bs18so9803566ljb.1
        for <soc@kernel.org>; Mon, 03 Oct 2022 04:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=WF1YkiRGRhpnhgG0MdjR1Rgf44GJQe4txZ7kZbtuE7U=;
        b=ATQv3IsamPVbotj8GgPwBLFZgwn4aA6SJFqTvn/tMbIvYPxlghtHW3uvGlQh1HV6op
         PgJSGMYBtGQiO4xbottomfzlzQ5OAlsGVN/g0L5prp9VEVQIPUiRQDgV2MVhGcgPE+o+
         g7K3nDLpKsS8+lmbuPTMYb6Op87omIjdQwIohXFDqYXA6Lo80q26c/Wm9ca48Gmoi7Hn
         /XjXR+NcyJ4p+rSQ8+BQdttsPP/Bpt7dIL6oe50HjR8tcVzHrHadwbYEahE4r5YdR/aa
         RMCS5qivj4I5MpGD535czlMQADuZCzzPLkw81i4PcQ2zbw6HhoW08WXqwd37XbbeVHH7
         y07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=WF1YkiRGRhpnhgG0MdjR1Rgf44GJQe4txZ7kZbtuE7U=;
        b=BFdowUJ3gKy36vzyxoD7eGVGBSg3CsECxjpLePRm+Dohyox9LGAMQYwdt3PBQnf62z
         s3O3mzBNvtfajbEOvKR7s9UPWBxj27zhiUutJJSuqncBZowj/mh6Il2nnryxQvf8HUuR
         6dMeG6beChWUJdO6upfDuHZbfQ3fGy+tW6zQbbVInu/FswPuFlK8gpJuhSMP8fYieNqC
         2Q5QPLHN7EVllEWHcfuK31uqpa7zRrpspS68Q778wKo/ei3Zelkd6gnjdKCdYz1abIaG
         M0sZbFJ/8SNnCjARGVm9o9+6qaU6JtG5OXSCsoFcN3ZGG3Cuiy+FG2gSYbAOfrjGlAZr
         tWWQ==
X-Gm-Message-State: ACrzQf3H1DV20Ry4TgNhdWnCTH4LUqe/G80iEmRUk3G0BvpSxAJ8NKWn
	yNpliacQdnp3fe2CxMZfgza+QA==
X-Google-Smtp-Source: AMsMyM7vPpmc4h455++S9oOL04kXh/D9Rg5XKZfQQxiHBzr+waGoEtDC65ZJ/Y+UXEH8tKm9Qljk2Q==
X-Received: by 2002:a05:651c:983:b0:26c:1c6b:8473 with SMTP id b3-20020a05651c098300b0026c1c6b8473mr5975005ljq.341.1664796261157;
        Mon, 03 Oct 2022 04:24:21 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a9-20020a05651c010900b0026c44771d02sm176616ljb.11.2022.10.03.04.24.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 04:24:20 -0700 (PDT)
Message-ID: <30ecd769-7820-0e0c-20a0-efa7c88e8923@linaro.org>
Date: Mon, 3 Oct 2022 13:24:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [GIT PULL] memory: late (3rd) for v6.1
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20221003073237.11488-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221003073237.11488-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/10/2022 09:32, Krzysztof Kozlowski wrote:
> Hi,
> 
> Late pull for v6.1 with minor stuff - cleanups and bindings fix.

I just noticed that v6.0 was released, so this pull is a bit too late.
It's nothing urgent, so feel free to ignore and I will re-submit it for
v6.2.

Best regards,
Krzysztof

