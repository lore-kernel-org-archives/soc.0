Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01FC6C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 00:34:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2C0264EB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 00:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2C0264EB1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p62/usSoWx4qwiizHiZ+BNg4gu86EzX3MMmSw0E4IKI=; b=OOyBTrgAIS4TfVEdQJAJJ7r5H
	ZPHwtlDON3kJyp1a2IfjFjj/Ek6I/Z9hYnxi/2LgQFsA36bM8qWRLRRHzHpgNZghqtjc/TI8d9Vhu
	zOY4cfYY96dJEyzucg0Qn2ovXybAtEO1nqD4tX5x2KEH3989D7+tdSmpTVEbzeaMT9WCi0HRVcp2D
	xaL/8+3LpqCyNJBCzs+mOT7OjqeOEYbdBrIp/mJLgX/Y+BWpCl8NEYwdAxouD2rFQ3CFgpvxLyz+1
	pVjYWEkwIATaW/WZEiaZGH0lQulEqldnFMqIstCZ4qXUkOHUgIPx3qqV2EpNiyyRXkdmx4Xsl1+oN
	1oXoZcQsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Gxa-0000nA-N2; Tue, 09 Feb 2021 00:32:54 +0000
Received: from marcansoft.com ([2a01:298:fe:f::2] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9GxX-0000mc-Eq
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 00:32:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 5BE0441F47;
 Tue,  9 Feb 2021 00:32:47 +0000 (UTC)
To: Rob Herring <robh@kernel.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <20210208110441.25qc6yken4effd6c@kozik-lap>
 <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
 <20210208121325.owjjd7nfbdanszny@kozik-lap>
 <CAK8P3a0yBC3dui6vcz+NByWD-3LqRj-2MF89jpjb_k8r5xmNRA@mail.gmail.com>
 <f98dc238-6742-455e-3f76-e86ae4c0c838@marcan.st>
 <20210208175847.GB1567700@robh.at.kernel.org>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
Message-ID: <cace3b98-b102-ffb7-2fa1-1fa896160774@marcan.st>
Date: Tue, 9 Feb 2021 09:32:45 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210208175847.GB1567700@robh.at.kernel.org>
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_193251_638226_35C4F248 
X-CRM114-Status: GOOD (  12.73  )
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
Cc: Arnd Bergmann <arnd@kernel.org>, DTML <devicetree@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, SoC Team <soc@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209003245.F46M8UoslONC-6lCtBOFHBnKpFKwlzphFDtPJDCycOg@z>

On 09/02/2021 02.58, Rob Herring wrote:
> I'll also highlight there's a DT only tree[1] available to import DT
> related parts to other projects. It's generated from the kernel tree.
> Probably an overkill to copying at this point though.
> 
> Rob
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/devicetree/devicetree-rebasing.git/

This actually brings up something else: do we want (eventually) *all* 
Apple boards using these SoCs to have up-to-date devicetrees in the 
Linux kernel tree? Obviously not every device supported by mainline has 
proper ones in, but I don't know if that's expected or something to be 
avoided.

If this is intended to be kept in sync and be fully comprehensive, I 
might as well start planning out our longer term DT maintenance strategy 
around that (which might involve using that tree in our bootloader).

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
