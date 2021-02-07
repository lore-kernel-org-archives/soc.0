Return-Path: <SRS0=h8h3=HJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D9A8C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Feb 2021 08:06:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8B1F64E88
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Feb 2021 08:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8B1F64E88
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AMo5YEWtgpjt7EPAjwJiRrJXX5+VauhElmMIRxokAZA=; b=HRatgJ7aYHVRnjrr0WM4NvInD
	3SxmdxKtdaH0tsa4Y1GGNF4Ob1oIelp+QFSFzxgoXxS0ciLoCRqKHEiD24nPhz78bw3aNCFymuCeJ
	BaXbKVH95GHUgO5fBuBTHHEhgyodF+1l1sYoIjySxW6zOrvRRhl5LuKAExyqeZmfii3B6s8G2qa/D
	m8VjP9PrXS/MfkHHRtB6iphWPFCAh2D4hONmz2Q0qNw3cZSSWFrNHfTkIsErCG7j7fKall+KZnD7N
	uIMCsDvHiCxJq9rn3sGeatGj/WlrfbznWs2WV5ZnGyC6XyibTASU0U+8YZnTUmKWy47x1khXhn93m
	pdHXmxCVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8f4J-0004n6-Ao; Sun, 07 Feb 2021 08:05:19 +0000
Received: from marcansoft.com ([2a01:298:fe:f::2] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8f4E-0004mS-UA
 for linux-arm-kernel@lists.infradead.org; Sun, 07 Feb 2021 08:05:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id DE2DE41DF4;
 Sun,  7 Feb 2021 08:05:09 +0000 (UTC)
Subject: Re: [PATCH 04/18] arm64: Kconfig: Introduce CONFIG_ARCH_APPLE
To: Marc Zyngier <maz@kernel.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-5-marcan@marcan.st> <87k0rll4i8.wl-maz@kernel.org>
From: Hector Martin 'marcan' <marcan@marcan.st>
Message-ID: <6eabfdb7-826d-a07e-33a9-3f1e75039272@marcan.st>
Date: Sun, 7 Feb 2021 17:05:07 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87k0rll4i8.wl-maz@kernel.org>
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_030515_134298_4DD0C702 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, soc@kernel.org, robh+dt@kernel.org,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210207080507.le4PRBlIhmQZSTcjESSFrjhYMACHUdgCWRP0I4aVdZ8@z>

On 06/02/2021 22.17, Marc Zyngier wrote:
>> +config ARCH_APPLE
>> +	bool "Apple Silicon SoC family"
>> +	select GENERIC_IRQ_CHIP
> 
> nit: This is better selected by the interrupt controller that relies
> on the generic irqchip infrastructure.

Ack, changed for v2.

-- 
Hector Martin "marcan" (marcan@marcan.st)
Public Key: https://mrcn.st/pub

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
