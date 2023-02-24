Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E60C678DB
	for <soc@archiver.kernel.org>; Fri, 24 Feb 2023 09:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 461BFC4339B; Fri, 24 Feb 2023 09:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20FAEC433D2;
	Fri, 24 Feb 2023 09:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677230153;
	bh=ZwIAkcJYnPRx4lGK5/p7jfNvhhS+lNRtT4E+uIjxQmE=;
	h=Date:Subject:To:List-Id:Cc:References:From:In-Reply-To:From;
	b=Zz6WxXbVoxk+iJni2r+G012R+dsrrW+xkYkz67xIcYS8SNGNydk2oMXgCxnAugme4
	 sfxc/pNwv2LAO4D6XxOlM1l3I9TF+IvdECvHy/nA4Cqoj4kKT8/lBPbF8yrg8zowle
	 FCcm9EtLFUEDfuoQNAW7Avd5VE68c06lelWW2B0bkj/l5VHRKApKO+XT4AokUYFm3W
	 AqHyHld7fjuwFnPVfmN4Lu1ZMSNWRX29c3eJO+NDxn6d3wTUcQkbzr1K7D5e12fRIT
	 RJ8jz2a8clJN6HTggsLxgLvPt02EghQmfO2YZMMlj5TnL6rGK37NnVE71ReYkZ8mkl
	 CU9eKjJtG3QKg==
Message-ID: <98867251-1f59-fdc6-9535-49db7b24140a@kernel.org>
Date: Fri, 24 Feb 2023 10:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RESEND 4/8] dt-bindings: leds: Add
 cznic,turris1x-leds.yaml binding
Content-Language: en-US
To: Lee Jones <lee@kernel.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
 soc@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20221226123630.6515-1-pali@kernel.org>
 <20221226123630.6515-5-pali@kernel.org> <Y9OypLjJb+O3yvhw@google.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <Y9OypLjJb+O3yvhw@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/01/2023 12:16, Lee Jones wrote:
> On Mon, 26 Dec 2022, Pali Rohár wrote:
> 
>> Add device-tree bindings documentation for Turris 1.x RGB LEDs.
>>
>> Signed-off-by: Pali Rohár <pali@kernel.org>
>> ---
>>  .../bindings/leds/cznic,turris1x-leds.yaml    | 118 ++++++++++++++++++
>>  1 file changed, 118 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml
> 
> Needs a DT Ack (now Cc:ed)

Within the same day of posting v2 of this - just after 4 hours, Pali
received review and I pointed issue to address.

The issue was not addressed, just ignored.

Therefore this patch shall not be taken, until the issues are resolved
or discussion is finished if there is disagreement about my comments..

Best regards,
Krzysztof

