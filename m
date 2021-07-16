Return-Path: <SRS0=r7Jl=MI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF431C12002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jul 2021 21:34:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5641D613E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jul 2021 21:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5641D613E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ew3XxZPNYRwbB2c8sr3e7ym8MapOJQgRLSpYLrTYbAU=; b=2eSfZYMxSgKlQt
	6DgGB8nyuqZboWW70FwK1v6LDdqI03Yptox5JhbtsQ7+dRftTaZm47BEWcRkeI3qQ93A8zCsvUkhR
	TrMAfomi+YDmYLw6Rk1Qe0V2UTaHN0gXE9xt3fwxiEunkGMJhAW9zIYwhkA2m0i+4PO762Ro9RXC1
	IOCmiTeWOSlCyXPfFKQvWGXYfswavHOldDCEVxyUP6Ii9DBG5BaqKzOMN7Z86z00hIBq2cCIaQzYH
	bHofVng/PLMTECdWSYamfXGv4gf1chM1ZWvIllFbCA/Sjas1T90ZFuV84N3S2WGVL61fAU4R3Le5k
	ppR4lnG0mq1sWq+9hjHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4VRA-005Khz-Lm; Fri, 16 Jul 2021 21:32:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4VKr-005ICA-UF
 for linux-arm-kernel@lists.infradead.org; Fri, 16 Jul 2021 21:25:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 12C0E61374;
 Fri, 16 Jul 2021 21:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626470729;
 bh=BVdU0dsdC+M+NMJR+sQfIqy9DFbL4rCnKiZWc6RcKUc=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NAjU3Y3IMxUjjZys4SpmgckvH8aWBqvjQZfg+mYx0n7GOmqm0d6lYoHqPD7MKqqwe
 T9pFCjJKu4PmD6bNXKkigdo1cLungkfeKBTBwrS4jngBX5D7bAFvK+61h4OJn3cU9n
 FSB+2osilqtFDmVXMxg2N3P9ovHBm3qZH60amU/r0/AhU5sbNOz6ZtAs2KLd/heU5R
 4C5d+AA2hJeQytL1borN8Xyos1WT89sLdUx9r65ik0t0gsqHzV5MX7qIcJpWsCFGkS
 YVX32oNn1OfZkOjnDdJNj/Kdk9upnD+xFi6RuZ5w4z6dZalOtsg4wDddxGUWbIt3T8
 8waPG0YDlUEGg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] ARM: dts: versatile: Fix up interrupt controller node
 names
Date: Fri, 16 Jul 2021 23:24:54 +0200
Message-ID: <162647049998.3478428.9987238633660084140.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210701132118.759454-1-sudeep.holla@arm.com>
References: <20210625235834.830035-1-linus.walleij@linaro.org>
 <20210701132118.759454-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_142530_065361_08A229FC 
X-CRM114-Status: UNSURE (   7.46  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210716212454._95BA3Ee3MXk2IYFdg0rr2EkVuA8OpgtYlcMFGH349M@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Jul 2021 14:21:18 +0100, Sudeep Holla wrote:
> Once the new schema interrupt-controller/arm,vic.yaml is added, we get
> the below warnings:
> 
>         arch/arm/boot/dts/versatile-ab.dt.yaml:
>         intc@10140000: $nodename:0: 'intc@10140000' does not match
>         '^interrupt-controller(@[0-9a-f,]+)*$'
> 
> [...]

Applied to arm/fixes, thanks!

[1/1] ARM: dts: versatile: Fix up interrupt controller node names
      commit: 82a1c67554dff610d6be4e1982c425717b3c6a23

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
