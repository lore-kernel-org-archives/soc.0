Return-Path: <SRS0=i2+K=CV=collabora.com=cristian.ciocaltea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B58C001B0
	for <soc@archiver.kernel.org>; Mon,  3 Jul 2023 18:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 26FDBC433C8; Mon,  3 Jul 2023 18:10:20 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7522C433C7;
	Mon,  3 Jul 2023 18:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7522C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from [192.168.1.90] (unknown [188.24.137.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 834A46606F85;
	Mon,  3 Jul 2023 19:10:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688407816;
	bh=UU/JyNAeehW37wvqIZuneyiVzqMP1lc3HgGiWGDbDOg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q8LW9XQfLueXxVtJqDx0XQEnUIw2KFEYQTwlFkQBWujJMF4RIrNrmaAPwzllEMYd5
	 I+JUT30wwo7pFcLLKxBGCx76qzxbnvERAyaZGOzb3iQVI/OK4m+bl4TgW7skJJfNsg
	 b7PpCmIGCo1bBJ8e97EpmvuXlshmjmmUWuHQAHEmjv7JWYstpkkrV8PtfWZG3Fc49c
	 1WXDMzlPVK2izZ/AVGSOmlxaVrCiMyNePsCJhXvzIys1XKjgHjrSSRWOCYHpZm3MQC
	 zzgZLKTPgr43gGAGiXqdnmzOjJWDy39YJlZZWZCoRJWkqwprku4SPfBdPAfPDnLa2Y
	 EebYFdKgKRP5Q==
Message-ID: <f527a768-a92c-5565-6fa1-a6396869d1c0@collabora.com>
Date: Mon, 3 Jul 2023 21:10:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [GIT PULL] ARM64 RK808 defconfig fix
To: Arnd Bergmann <arnd@arndb.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, arm <arm@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kernel@lists.collabora.com,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
References: <20230615174940.jmzuv5kb6o7htkwo@mercury.elektranox.org>
 <5dd55b3f-9a12-4c3e-99a8-b81add924cbb@app.fastmail.com>
 <20230621122854.yvffeuhhp4ywqcla@mercury.elektranox.org>
 <83094b7e-5298-4d9d-9eab-8af979c3f710@app.fastmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <83094b7e-5298-4d9d-9eab-8af979c3f710@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/21/23 16:10, Arnd Bergmann wrote:
> On Wed, Jun 21, 2023, at 14:28, Sebastian Reichel wrote:
>> On Wed, Jun 21, 2023 at 11:36:48AM +0200, Arnd Bergmann wrote:
>>> On Thu, Jun 15, 2023, at 19:49, Sebastian Reichel wrote:
>>>> Since I did not get any feedback for the defconfig patches from [0] and they
>>>> are fixing a KernelCI regression (Rockchip Chromebooks no longer boot because
>>>> of missing PMIC driver), I prepared a pull request with the defconfig change
>>>> instead as suggested by Tony [1]. It consists of the rk806 immutable branch
>>>> prepared by Lee Jones [2] and the arm64 defconfig patch. I will send a second
>>>> pull request for the arm32 multi_v7 defconfig. This is targeting linux-next.
>>>>
>>>> [0] 
>>>> https://lore.kernel.org/all/20230518040541.299189-1-sebastian.reichel@collabora.com/
>>>> [1] 
>>>> https://lore.kernel.org/linux-omap/20230604060436.GT14287@atomide.com/
>>>> [1] https://lore.kernel.org/all/20230515152425.GV10825@google.com/
>>>
>>> I don't think it's important to have bisectable defconfig changes,
>>> and I'd prefer to just cherry-pick the two defconfig patches in
>>> this case if that's ok with you.
>>
>> Sure, please go ahead. I just want to make sure that the regression
>> is fixed.
> 
> Done
> 
>> By the way, what's the merge strategy for defconfig patches? Apart
>> from my RK808 fixes we have some other pending defconfig updates and
>> nobody seems to care:
>>
>> https://lore.kernel.org/all/20230504201916.1121243-1-cristian.ciocaltea@collabora.com/
>> https://lore.kernel.org/all/20230604171345.1215276-1-cristian.ciocaltea@collabora.com/
> 
> I normally expect defconfig patches to go through one of the platform
> maintainer trees, the same way that I merge dts or driver changes,
> so I tend to miss patches sent individually, unless they take soc@kernel.org
> into Cc, which puts them into patchwork.
> 
> I've applied the above two now, as they seem harmless. I see that
> Heiko was not on Cc here, so he probably never saw them.

Hi Arnd,

For some reason, the 2nd patch ("arm64: defconfig: Enable Rockchip OTP
memory driver") didn't show up in linux-next, but only the 1st one
("arm64: defconfig: Enable Rockchip I2S TDM and ES8316 drivers").

Could you please check?

Thanks,
Cristian
