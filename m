Return-Path: <SRS0=N7fp=HB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD54C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:33:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B4B464DDE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B4B464DDE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=holE3EXeO4EbejmvWY8H0nWIAqB2rs4/NTsMOHxSTYM=; b=HJenxn39KlbQS9jXXMhRzhdiV
	ufMBuGmXwJVKkxQvpnW77zqN9uOYYAf6td1HlmX/KL9T3Daza5H6x8KGQewe9mTtccVVngS86viPh
	BPlKQrYHlJF/MHeattDLbrDvDNC4oDC8/C1uEJkZSqca+AA/EcyXMrg9ytWPrM5McDR+qazxUYEKm
	9Mjl8wR7k7NVZdYtTT5CNi8oXyqPr/TZUgkF8ckWPRRDbEKhhK+anIPYuzUuxZHnZP0uPe9XxKVpU
	gqpmCA167MgKtLYGmW4Z0FJYgDx3nOI0o0tXVaNihBx1ArkIH5yfTi03Ji3RCdj0y5dA1yviEh0Ck
	ocjE6Nj8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5oUB-0000VB-QI; Sat, 30 Jan 2021 11:32:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5oT8-0008Vh-3m; Sat, 30 Jan 2021 11:31:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E36864E0B;
 Sat, 30 Jan 2021 11:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612006269;
 bh=UV50urgspytuY9CWXJcNPcTe0lVc6bHC5gQXoZf8BFs=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nohkj68WzyVWhZIq6nNV0516VeGHJBqexhz9R30JMyLBIeQg/JfGplEkphHu7SBKR
 TD9YHNk/L/bS7fg3PY5J6CzrnkFARDaVwS3OtVxioCSKSk10mvui8z9zWnnk+Gdpy6
 pIH3MxYcEJPIg14PdTm9Wt5hPG9bJn/o14yfNnIbWziNXxONMb2U9gsne/3JzXBbGq
 ztth37/iSJEZcbX8owGa/i16xnGRuHk8nac9d8i6wPmUh/PklJR6RqNEUIVqDsZMT4
 6HPgI8MT1I0o5LeMWw0kv9yPO+8ySClJsS7s36vm2ZdCUn+q04t25nEvH4H7IitE82
 x+2d1CBZcXT5w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Kevin Hilman <khilman@baylibre.com>,
	arm@kernel.org,
	soc@kernel.org
Subject: Re: [GIT PULL] arm64: dts: amlogic fixes for v5.11-rc (round 3)
Date: Sat, 30 Jan 2021 12:30:52 +0100
Message-ID: <161200623045.2192465.17705478393646031339.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <7hk0ryi6rs.fsf@baylibre.com>
References: <7hk0ryi6rs.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_063110_310228_6045CC62 
X-CRM114-Status: UNSURE (   8.19  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210130113052.XUJxBs5CJLfonthspbQ0zGV8856vOaRVx9IC29JGHlY@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 27 Jan 2021 10:17:27 -0800, Kevin Hilman wrote:
> Arnd, Olof,
> 
> Sorry for all the one-off fixes this round, but here's one more fix for
> v5.11-rc.
> 
> Kevin
> 
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: e2fc2de8e1aacef4c76f7a4b8c6162874d3e2801

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
