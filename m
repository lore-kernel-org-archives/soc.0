Return-Path: <SRS0=w++m=JC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD08C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Apr 2021 15:52:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 950E6613AF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Apr 2021 15:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 950E6613AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ChRlA0aNbo7FYm+DFdbZwnFQdpG8qyUtGMZXvd8YJZY=; b=J3t/dff7cxOnO9N9Z1DJhL5WtO
	UVf3RINeTvE3WXK5cWF1kTPaqs3yXSzVE15ZDXaYn640RN4B6LIYvYdbjeLyEMrpnE3BhiDjK02Cu
	vpy/Grhk/iaCsy01lGkOc2obI4DW5cdzea3UZTLags87h2KuuCCHv+20JeYwJhTLPmu6GtLbscLev
	q2inK6R7hovana+zKOhE8bawfSmAY+wn2L2Itv7i1rEvnl7mxByQYvvLoUBsTOVuhm32ktJ32c/lr
	7QVOUZ/HSU67mW5efFnXpRVtmBeSJ3YnMpxftubz5j3A3SRYHvZJfrviBsa5rSvnC8UOcjEiSHv+C
	HLzfw8Pw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTRUr-00HW14-C0; Mon, 05 Apr 2021 15:50:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTRUn-00HW0M-FG
 for linux-arm-kernel@lists.infradead.org; Mon, 05 Apr 2021 15:50:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CBCDE613A3;
 Mon,  5 Apr 2021 15:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617637828;
 bh=plOVgI4LGVoBmO3BXhYn0AoleGWw5cqkeyjVMw4xDBw=;
 h=From:List-Id:To:Cc:Subject:Date:From;
 b=q/5h57BL6Nk48FjTfbpv2CXHLiTes03XOI6hK5nlwO5rLPNAcT5h2kOj3qPdyA1Mp
 jwy4ttLuoIWejs1l2L3hIuUDoKJedBk9/c7K/NopjCdj4pFlD52N7oJrQoouDPeAeB
 SKVil21fR/cD/zEtKS2OCOkX0dYfkq32FtJiVfEVgjz2TxfHi0NKhDzOu8gUTQBIij
 WvIJnrY/Du8KcSs1zSq+T3tEZHIya/udbKyafK+R3NLzvc8Rm8XJTOeKEHKUoPWGaL
 Dqf+hileJmNgcP8HQ8EoahnWLFnLundzMPrbQswRq7qob7MtRXahpviNTq+EK03qNJ
 jcltUJHRPOpOg==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] SoCFPGA firmware update for v5.13
Date: Mon,  5 Apr 2021 10:50:26 -0500
Message-ID: <20210405155026.86309-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_165033_708963_AE44163C 
X-CRM114-Status: UNSURE (   7.73  )
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
Message-ID: <20210405155026.GkjwXS6TIw2RFH6YbbQhlDL-NiREpgNcgUXmebnkBbM@z>

Hi Arnd, Kevin, and Olof:

Please pull in this patch for v5.13.

Thanks,
Dinh

The following changes since commit 4483397b03536506535d611b0cb28a81a69e8edf:

  ARM: socfpga: drop ARCH_SOCFPGA (2021-03-23 11:03:36 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_update_for_v5.13_part2

for you to fetch changes up to 38ad957b04c5c2c9effc6336365187dae1301051:

  firmware: stratix10-svc: build only on 64-bit ARM (2021-04-04 07:41:43 -0500)

----------------------------------------------------------------
SoCFPGA updates for v5.13, part 2
- Only build Stratix10 Service Layer and RSU drivers on ARM64

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      firmware: stratix10-svc: build only on 64-bit ARM

 drivers/firmware/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
