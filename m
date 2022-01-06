Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1386DC433F5
	for <soc@archiver.kernel.org>; Thu,  6 Jan 2022 01:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CC303C36AEF; Thu,  6 Jan 2022 01:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69693C36AE9;
	Thu,  6 Jan 2022 01:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641432387;
	bh=jyGta/tMBSDQlAil8tk+2rbm168p2Ila6Txh/qRR/ZE=;
	h=Subject:To:List-Id:Cc:References:From:Date:In-Reply-To:From;
	b=JGbYkw6DjKSJFrnY/61WKxIIJa14Y3KjGr5hg6CClER7XdcsE692kPynpVuJMqdZO
	 5XzdiuGB723yg/zZDWbdJU/2wVAhpWh0TrUbmb1jjg4M/25xmxaLiNgMKHr1bcbsHQ
	 QUqj6pqg/QSUhpPPosps1hZLG4tFmCQMClguJiYxSFBjkH/ego/LdA/duuCl2UMspE
	 6qgfvWg51W7/Ig68enzZI9EPfXVaplZF/8SucfsygNzXIu+Me71nbJ5ahn45C/DxOi
	 xd+O55BhXmcq9egg6CCeZeYQLDkOVXAUQ74KNCfl2XR4b39JMnanApspU1CMGcaJjM
	 KwHs7MstVfnbQ==
Subject: Re: [GIT PULL] ARM: socfpga: fix for v5.16, part 3
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: ARM-SoC Maintainers <arm@kernel.org>, SoC Team <soc@kernel.org>
References: <20211227103644.566694-1-dinguyen@kernel.org>
 <CAOesGMj7y6z6p_vMUVaPbSuieZBhHqk=L9MC+yx8UwK2T+coog@mail.gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <4f750746-eca8-947e-4ad2-9e82ef884215@kernel.org>
Date: Wed, 5 Jan 2022 19:26:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAOesGMj7y6z6p_vMUVaPbSuieZBhHqk=L9MC+yx8UwK2T+coog@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/5/22 6:23 PM, Olof Johansson wrote:
> Hi Dinh,
> 
> On Mon, Dec 27, 2021 at 2:36 AM Dinh Nguyen <dinguyen@kernel.org> wrote:
>>
>> Hi Arnd/Olof,
>>
>> Please pull in these 2 patches for v5.16. The reason for this dts compatible
>> change is that the commit 98d948eb833 ("spi: cadence-quadspi: fix write
>> completion support") is already part of v5.16, thus we need these 2 patches to
>> be in v5.16.
>>
>> Thanks,
>> Dinh
>>
>> The following changes since commit fc74e0a40e4f9fd0468e34045b0c45bba11dcbb2:
>>
>>    Linux 5.16-rc7 (2021-12-26 13:17:17 -0800)
> 
> Was there a reason you chose to base this fixes branch on 5.16-rc7
> instead of an older -rc, or the previous fixes branch that you sent
> in?
> 
> As a result, we now have to bring the base version forward for our
> fixes branch in our tree (and our for-next branch as well).
> 
> It's usually best practices to use an older -rc (-rc1/-rc2 if you
> can), and/or continue using the same fixes branch if you have
> dependencies between previous fixes sent in for this release cycle.
> 

Ah, sorry about that. I'll keep this in mind for future work.

Thanks,
Dinh
