Return-Path: <SRS0=xpWt=HN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C64FC433E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Feb 2021 15:05:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1457464F0D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Feb 2021 15:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1457464F0D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RmwZG0+JTzF21vRCTeR/kd/jtWn9IH6elwbSg9wC0/s=; b=fMT3/CCEptzBGg9t8prrDKQv2
	9S0nnBnOrDhZxo0zeKTVgjCurTPhqMQSLRFImzE9JEHmEe531N04wSMmBeZasdtkdNXIWsPzKqGfg
	xJWFw/rTUdd8HeHCLcdh0AAUYTKrgpjbP+y2vqpNzMUZpZ4OSz+mbyX/uiPje+KB1GQbHcki1ROBJ
	PBVES4MSp2ITQahRVngkvp5E0rahHK5nSDmCvMqJO2TrlJ80Jpntcg7oO4lx5JUzRaXR24i+19JeP
	APD1WsVNwonSuF1P9sw4OYmKJAZ4usMdlIQ1u1BXGaL6dxeK1rzmbeFFpAlY4wuk50XYO6+lK4Hjd
	xvnY+L/BQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lADWD-0005nP-EK; Thu, 11 Feb 2021 15:04:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lADW8-0005m0-HM
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Feb 2021 15:04:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D841B64EEE;
 Thu, 11 Feb 2021 15:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613055868;
 bh=1d42BxUE/1dsT5m/gRPrkorZT4HaEgiBeyVaFobzOsA=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VxGM0fV48RHhFOhTkFUOGLeqpCmEV7wINIoEY+BFlvgjWqtGRDU0/RodkCAzi2Bm4
 iFH6FFcN4UtWqBunHqcg6C4ndQ9lYLMsaYgJqCEyUE6UT2skOw6VeTeFug9zwsF5Js
 YIRqj1hNbSAa/hVu8hiQlZivuvu+0Jb+1u0ThMPTro7rZ/qPIjrXfx0XatomIy/LlU
 tLEEd+SUIkkb7hsnLlW8v3EjolZW8M7C2eRib/JyKqzJkms3owcD4EDg8BlXINHwQt
 qY4QZZBz++A3KM2i4fJAKTDD4EHsQK8ywf5nEv2x/Y2dGYHYkCXlfnaqdoO0996S0H
 SrgKgxJzmkS2g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>
Subject: Re: [GIT PULL v2] ARM: dts zynq: Xilinx DT changes for v5.12
Date: Thu, 11 Feb 2021 16:04:21 +0100
Message-ID: <161305573925.259289.17212813544897085950.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <19e0e0c9-1bed-bba5-6c80-6903937b3d96@xilinx.com>
References: <19e0e0c9-1bed-bba5-6c80-6903937b3d96@xilinx.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_100428_711273_9F04FE8B 
X-CRM114-Status: UNSURE (   9.88  )
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
Cc: arm-soc <arm@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210211150421.INbxdvb4BiBMZqvq3GSa8_7hArNlz_7XKKWZ9cw1k3I@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 11 Feb 2021 12:33:01 +0100, Michal Simek wrote:
> please pull the following DT changes to your tree. The major part is
> adding one new board and qspi dt binding conversion.
> I have dropped one patch based on communication with Arnd.
> 
> Thanks,
> Michal
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 78155527283ddb04bb4a5b78320c861e1035d357

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
