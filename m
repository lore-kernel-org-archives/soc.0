Return-Path: <kvalo@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CFEC4361B
	for <soc@archiver.kernel.org>; Mon, 14 Dec 2020 10:02:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1D81322AAD; Mon, 14 Dec 2020 10:02:29 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id CDCD4C43464; Mon, 14 Dec 2020 10:02:28 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: kvalo)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id D6097C433C6;
	Mon, 14 Dec 2020 10:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D6097C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: David Hildenbrand <david@redhat.com>,  arm-soc <arm@kernel.org>,  SoC Team <soc@kernel.org>,  Linux ARM <linux-arm-kernel@lists.infradead.org>,  stable <stable@vger.kernel.org>,  Pavel Procopiuc <pavel.procopiuc@gmail.com>,  Vlastimil Babka <vbabka@suse.cz>,  wi nk <wink@technolu.st>
Subject: Re: [PATCH] ARM: dts: ux500: Reserve memory carveouts
References: <20201213225517.3838501-1-linus.walleij@linaro.org>
	<cc06e06b-ff24-68a2-f5f3-c8533118a34d@redhat.com>
	<CACRpkdZp+gnJAo02OJkiN_KUX3bOPc2vzQGWHLZF2hQHvuQQkw@mail.gmail.com>
Date: Mon, 14 Dec 2020 12:02:23 +0200
In-Reply-To: <CACRpkdZp+gnJAo02OJkiN_KUX3bOPc2vzQGWHLZF2hQHvuQQkw@mail.gmail.com>
	(Linus Walleij's message of "Mon, 14 Dec 2020 10:27:28 +0100")
Message-ID: <877dpk3du8.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain

Linus Walleij <linus.walleij@linaro.org> writes:

> On Mon, Dec 14, 2020 at 10:21 AM David Hildenbrand <david@redhat.com> wrote:
>
>> > ARM SoC folks: please apply this directly for fixes.
>>
>> Can we come up with a Fixes: tag or has this been broken forever?
>> (assuming modern boot loaders)
>
> It's been broken forever :/
>
>> > David: just FYI if you run into more of these type of
>> > regressions. Actually the patch is unintentionally good
>> > at smoking out other bugs :D
>>
>> Thanks for CCing - I'm adding some people that ran into similar issues,
>> but not sure if the other bugreports are related (or have similar root
>> causes).
>
> Yeah we first were convinced there was something wrong with
> the patch you made but I read it over and over again and there
> is nothing wrong with it at all. It just alters the behaviour pattern of
> memory management in some apparently drastic ways.
>
> After a lot of silent crashes I finally got an external abort with
> a reasonable backtrace showing the PTE pointing to this
> modem memory and then we figured it out.

We had similar experiences with ath11k (Wi-Fi 6) and QCA6390 firmware.
So indeed commit 7fef431be9c9 ("mm/page_alloc: place pages to tail in
__free_pages_core()") is a great way to catch odd firmware or hardware
problems, which most likely would have gone unnoticed otherwise and
users would have end up experiencing random crashes.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
