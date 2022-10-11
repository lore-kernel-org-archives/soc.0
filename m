Return-Path: <SRS0=0mhx=2M=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D252C433FE
	for <soc@archiver.kernel.org>; Tue, 11 Oct 2022 03:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 623DAC433B5; Tue, 11 Oct 2022 03:11:08 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5F490C433D6
	for <soc@kernel.org>; Tue, 11 Oct 2022 03:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5F490C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d24so12013804pls.4
        for <soc@kernel.org>; Mon, 10 Oct 2022 20:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OTAfYsbOtFvtvqiWBTGIW5SrFGY1WvU38VWPZFuksuo=;
        b=PGaSR7UKyhRUOCcgSBulfS7m9SVQfRvoQ9VUGGFPWDD2PumauAxBTOVmVa6sZ72tIN
         FEKCqq1XTMOH9tuQ5VlUuFOsJcPJ9NmAiqqeBQsR8g5ZMQTkAfOgD+d7p9QSLQk7AhKC
         YmxzU9GCheoyaLuwC1Nrw7pLXlka51aqtPrMhi2EVBGrXB3ns8rMpDBNiO5wp8+OSbRs
         MjteoZ5roNjW2OBvIA2BajgXdZRQ7pZIeLSF7KE8MmBpuC5vaLdUv6XnD1HQAbfmYcJ1
         uqEgH6M9tMAm1wbYbpFqro7SyLge4QGZu6zdhjBvc1/+nECWEJovLlEPk8ecE0Y0pNre
         OKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTAfYsbOtFvtvqiWBTGIW5SrFGY1WvU38VWPZFuksuo=;
        b=hGk5o966eWUvyfEtjad5VNfxJ9lD/h9cikpd0UtMB6dw8j+w4Ie5kYu7NCghngVOKl
         ZZW7lIrjCK2NqRBqQH9jHyZSVoImryVqLB6JFB87aozFdPbhcTmNVu50t7PiSaiSy1HS
         KcXtrv4/0FgFCUZMPRMyQWlV8uG2FsZaC6zJs+YfkLYL8OKMkVlRGc7tNEAFSfoWixDG
         +yGKMiC7ISVVcSj4wDAKtvJb8zZOMSt/K8JsWjFFOgRKWLyElpaWfOJ2yKNeIwk5GQSn
         ZVGor9epKQjTtEIfWsL3FfVXzgFrMaDfEM3A+gCbDSAX3BzvBEDXFmH7jUkY0/JzUcwV
         bJUw==
X-Gm-Message-State: ACrzQf3eG3+KLHrXCcDVznaMYdTlzyofh64/AnixVzEWtM620/4A4svM
	98g649q1MCrR09AmGi7dXgiD7Q==
X-Google-Smtp-Source: AMsMyM7AsryBn7diqfnZGV99J5DsEPP+gjPJ/BTTrBn5RpG8aEx2pM4fMziiDUvFnGmZybJ0ybfUcQ==
X-Received: by 2002:a17:90a:d48b:b0:20a:97fb:3eb with SMTP id s11-20020a17090ad48b00b0020a97fb03ebmr34324711pju.189.1665457866732;
        Mon, 10 Oct 2022 20:11:06 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id e24-20020a63db18000000b0040caab35e5bsm7005412pgg.89.2022.10.10.20.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 20:11:06 -0700 (PDT)
Date: Tue, 11 Oct 2022 08:41:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Russell King <linux@armlinux.org.uk>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>, soc@kernel.org,
	kernel test robot <lkp@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: spear: Move prototype to accessible header
Message-ID: <20221011031104.5gvw47ocbhj52oxy@vireshk-i7>
References: <f334e8bcc22fde795de9c8067898d4c0522d44ae.1665375739.git.viresh.kumar@linaro.org>
 <20221011010116.A6245C433C1@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011010116.A6245C433C1@smtp.kernel.org>

On 10-10-22, 18:01, Stephen Boyd wrote:
> __init is meaningless in header files

Technically yes.

But then I grepped include/ and it is widely used, even by core kernel
headers. Why is that ? Maybe just to keep prototype consistent ?

Also init.h says:

 * If the function has a prototype somewhere, you can also add
 * __init between closing brace of the prototype and semicolon:
 *
 * extern int initialize_foobar_device(int, int, int) __init;

Hmm, I understand that it is just saying that __init can be used after
function's name instead of just before, but isn't it also suggesting
that headers may also have it (maybe just to keep it consistent) ?

-- 
viresh
