Return-Path: <SRS0=GqV7=PN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FFAC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Oct 2021 16:35:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4A1460F46
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Oct 2021 16:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4A1460F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ufcr4A3cPZ+lLEzjY7sz4jX/nQAirLuAf3WO2wU+B6Q=; b=0fV8gSOPUMdGFz
	U3+EYmnwQOjCve2DoCC6yirh4H/+T3kx97Di+Ab86wx60/USsMOlDDfCPXJXELeSwWQgsvacy4OV8
	tJ9RVB/vCzhs1WUR5EjgJIC5NGyOSp0rNKbW0i6Hh0XhgW1Nd4zoZu+0/aEdMIVJfGcLo1+f0G7ID
	xLPbqnf5BxXLg2izQkrQpipTN+h5f8C+1m+H15s6qQpldryRQ3+xu7yYsGSP1P6uhkMKZCJPgq28n
	s/7INExf/zd1F97dQoBruCvXeP017PkhjGo3Ab3CG3inRXcLQYIr9U5vezKN8ktWWy6ajYhuTI3lk
	fE4kL3F7AqlWuNW7Eo3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf2vp-00H4D7-5W; Mon, 25 Oct 2021 16:34:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf2vk-00H4Bn-F1
 for linux-arm-kernel@lists.infradead.org; Mon, 25 Oct 2021 16:34:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635179676; x=1666715676;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HtlEET3sshwSu3d9oyto6pYaMpqazwviYxoxvTQEnUo=;
 b=U6hOamJc4dXXw/QDPJhUOnrESiQeFUH9ekOhvsechWWKXEjFC7o6BELP
 7E6Pihhxqompy5AjwsMNzLfrvK8V4DJbmMFhoVNXdTn84bfRGhvl96uZe
 dUUygrEtIjyWU0XB90tioqyIQfevHdilWPX4zTHWlOfWatxejp2goJw0c
 fnATNlJJQ1Dfg5s3xy7fxaaR7jzD8X530RXS1TQHjPTAGey8NnIFs4v3k
 /Gni9ECU54274n7vgcn2xLC9HI4qfN9R/KorPTL3ZmMn237Je/j+xK65/
 8YzpYTxOxiyzirn1uVXoAUlUh4oiw42pkJZ7sdm0jn/OxgsqnlAEde3ln w==;
IronPort-SDR: NO1D6j8D/bwDSF62n9QxiKRX2BAcgsPw4rYw+Bk44fMyBEFHE7VcsGNjgRSxq+b7LKr4EpI10D
 Byyu3bE3VHUgmAwPrxD4KUogl1lsR8qJh/paxjWEQES2dxPPJyjF8CCf3wHiTV59lygmryovBF
 35UXXcmwk3cKeBeGwC0U5LHAG7nnt+Q+WOPVmlSXCe8KvWocTv2frm24wLXf0YQDczZNGZQO6V
 FrV8terSDfs/cAUcLuYskZR4/lcQke2FPut/81jj1Qh96lirpf7jflG1t4kXpRmUW03C/bTp1L
 EO31rMipyiAwnUrnJynDNmbE
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="74197464"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Oct 2021 09:34:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 25 Oct 2021 09:34:33 -0700
Received: from ness.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2176.14 via
 Frontend Transport; Mon, 25 Oct 2021 09:34:31 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, <soc@kernel.org>
Subject: [GIT PULL] ARM: at91: dt for 5.16 #2
Date: Mon, 25 Oct 2021 18:34:28 +0200
Message-ID: <20211025163428.26285-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Organization: microchip
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_093436_641802_879CF55E 
X-CRM114-Status: UNSURE (   8.42  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux Kernel list <linux-kernel@vger.kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211025163428.sttwAxYNe404bW-zAxUY4K6oXOxFa3kPNR3LUkaU3EY@z>

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here are a couple more dt changes for 5.16. As we are late in the
development cycle, you can surely postpone their inclusion for 5.17.
They are in linux-next for a handful of days.

Thanks, best regards,
  Nicolas

The following changes since commit 4c46b991bab640ee91f16967be2b0d00b7d5f992:

  ARM: at91: dts: sama5d29: Add dtsi file for sama5d29 (2021-09-21 12:37:07 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-5.16-2

for you to fetch changes up to f3c0366411d6893360be21a7544595bf275bc9b2:

  ARM: dts: at91: sama7g5-ek: use blocks 0 and 1 of TCB0 as cs and ce (2021-10-21 13:45:16 +0200)

----------------------------------------------------------------
AT91 DT #2 for 5.16:

- Add DT nodes for TCB and RTC blocks on SAMA7G5
- Add TCB0 for clocksource and clockevent functionality fallback only in
  case PIT64B will fail to probe and as a testbed for this feature on
  the Evaluation Kit.

----------------------------------------------------------------
Claudiu Beznea (2):
      ARM: dts: at91: sama7g5: add tcb nodes
      ARM: dts: at91: sama7g5-ek: use blocks 0 and 1 of TCB0 as cs and ce

Eugen Hristev (1):
      ARM: dts: at91: sama7g5: add rtc node

 arch/arm/boot/dts/at91-sama7g5ek.dts | 12 ++++++++++++
 arch/arm/boot/dts/sama7g5.dtsi       | 27 +++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

-- 
Nicolas Ferre

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
