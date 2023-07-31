Return-Path: <SRS0=256q=DR=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9EAC001DC
	for <soc@archiver.kernel.org>; Mon, 31 Jul 2023 05:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D87CC433CC; Mon, 31 Jul 2023 05:05:48 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C359C433C7
	for <soc@kernel.org>; Mon, 31 Jul 2023 05:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8C359C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-53482b44007so2235190a12.2
        for <soc@kernel.org>; Sun, 30 Jul 2023 22:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690779946; x=1691384746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/qMzozlS01EvhKSIYBdj8EYscxDwpJrojnj03ew/Nl0=;
        b=vMLMmIv8UFxEoNtq9lst6r8TdPip2XqlRQvEUJ9YuMmzJFqV+b6HRa4PAkUQhZxqZO
         j7ToKnFaS6g3/+hVXiRXPkUh318Y6LtxrbJe7Dy+Hi9nHKCMPHI2AdnlCx3riwHW8PSG
         FHZO2a58LjQx08bx8UpNulujXQIFJ5XKIBXOjZnymt0MssA00ch6klqlwGB4UiamoAwc
         PUvZkne5Gb+SESf79Wfg1nkXUOSfz7zLsaqmBchMn1aXARh97Y6zLDC14+YwmZDmM2Vy
         OYz5pgoQBxFjnnKPQV94vGJx29No6Tgml8WMDDbBIZC2FNRw5jbXTqkG8JuEnauclqrd
         NpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690779946; x=1691384746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qMzozlS01EvhKSIYBdj8EYscxDwpJrojnj03ew/Nl0=;
        b=jSz/5E4fBm1FJYuqB3DsaJkgxSylexYrdvq19nHGdmS2il4TC+PHYWsRJhSjEz09OV
         rdvhTrIxK8z1NAQpLYhYHO6wh48JeHKNVn4AStmMZIIB0ozswfe6bvEjJp+iQLC16ZwK
         WwNTdIqH12S9HK7jAQEUeqvRVlLxy0j+9N9tskEyAPL8C4g41l0JB5SBiFcpLXe/75yX
         yGD8y33IEEirNCx1dIyt7pJdJ7QQhfSuUZ/VclDJyXwYTJFLSY7CNIoKPk7HruhimoqR
         XwP7cvq9agRHKvOx1yrjZr0Jnd+YLbj+ItX7jNYHFEXuJ9paQFWcyQL+4+6D6/EDucED
         OjAw==
X-Gm-Message-State: ABy/qLbso3hnHfE6Rlf6dq92dQvRs15tVHzB1OGdoXhEyQ+JTNmlqIKQ
	8c7ZPp5h1c7mQragMRoQ8civgw==
X-Google-Smtp-Source: APBJJlHkHWAlDNYLUb3vJ95nRjSnTPzvUIU0+adOasrwlsSU1tTRCXf9sg7a0lGvv/NSr1nWTOwy3g==
X-Received: by 2002:a17:90a:86c7:b0:268:2b5c:14c with SMTP id y7-20020a17090a86c700b002682b5c014cmr7247025pjv.13.1690779945646;
        Sun, 30 Jul 2023 22:05:45 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id j2-20020a17090a94c200b00263f33eef41sm7076501pjw.37.2023.07.30.22.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 22:05:44 -0700 (PDT)
Date: Mon, 31 Jul 2023 10:35:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: st: spear: split interrupts per cells
Message-ID: <20230731050542.uibx3cwfxzxydhpe@vireshk-i7>
References: <20230730111536.98164-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230730111536.98164-1-krzysztof.kozlowski@linaro.org>

On 30-07-23, 13:15, Krzysztof Kozlowski wrote:
> Each interrupt should be in its own cell.  This is much more readable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/st/spear1340.dtsi |  8 ++++----
>  arch/arm/boot/dts/st/spear13xx.dtsi | 24 ++++++++++++------------
>  2 files changed, 16 insertions(+), 16 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
