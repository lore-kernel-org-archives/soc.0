Return-Path: <SRS0=OtNj=MD=collabora.com=angelogioacchino.delregno@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2C0C4345F
	for <soc@archiver.kernel.org>; Tue, 30 Apr 2024 08:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1D923C4AF17; Tue, 30 Apr 2024 08:12:41 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 26BD5C2BBFC;
	Tue, 30 Apr 2024 08:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 26BD5C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714464756;
	bh=kMXbAn2OMOLooaNFeMvNIuDBVCdk3qcVfwbqeXByzDo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OjAtH466lRmOrMzIXWPkfcVEpGvebFlWG6hO25OPy6YdFb+ZfI3VgGarGOhdoUzjz
	 xfQNiOrVUvY+laLz9usSMjuURRl78S7BWlABpKy5dRs4ytEk52WH4ySnfF6NqBzGu5
	 Q5v4GAOTtNOrnYvyny0vraaZL7mrv8926+PnyiwfhFHYHH8na81XkyyTTOMrh4t5Mq
	 y7LC9RnC+L4F1kf9IF4DjJNzs0zC95PAyTOJ41fw/U0z9D9Mxlgq0Kh2LIo/HXufLb
	 n+lFdMcg/9AE74y4dZS5QkWxSkwElJ0mSVUmjGg0o9fzTOd9Jam+nCnsF4M5LYkiHv
	 NSlKrYxlL52Hg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 153AD378214D;
	Tue, 30 Apr 2024 08:12:36 +0000 (UTC)
Message-ID: <2d208466-369b-48da-93da-30ff5fbff1a8@collabora.com>
Date: Tue, 30 Apr 2024 10:12:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 Device Tree fixes for v6.9
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, arm <arm@kernel.org>, soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240423102915.371782-1-angelogioacchino.delregno@collabora.com>
 <dc4975fa-82ae-4b2b-94f2-c518595f8694@app.fastmail.com>
 <2a683392-9fda-4da9-9bf5-ffa2b982634c@collabora.com>
 <8f777b2f-ab15-4df7-91e5-f779f408fd65@app.fastmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <8f777b2f-ab15-4df7-91e5-f779f408fd65@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 30/04/24 10:06, Arnd Bergmann ha scritto:
> On Tue, Apr 30, 2024, at 09:55, AngeloGioacchino Del Regno wrote:
>>
>> Yeah, I have to fix my stuff to stop generating the gitolite address when
>> preparing the pull requests.
>>
> 
> This is what I have in my ~/.gitconfig:
> 
> [url "https://git.kernel.org"]
>      insteadOf = git+ssh://gitolite@ra.kernel.org
>      insteadOf = ssh://git@gitolite.ra.kernel.org
>      insteadOf = http://git.kernel.org
> 
> That should be sufficient to transform the URLs the way you need.
> 
>      Arnd

Yeah, it is. Thanks!

