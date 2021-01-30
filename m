Return-Path: <SRS0=N7fp=HB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BDFC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:32:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BFB964DDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BFB964DDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MWfnWu+7sPBhDwEu97pLulgBM2A5nEpqiiFgHEBxRTs=; b=2FBTg8AtcZWSbqAhqvVWFTxWA
	m52gxijhV61V1o72L0mYoMrVfFSv8FlXVCZoLA19aZq02DBcoOp8poKjGHFzhKgozj4wwflQ2OyT6
	qVQY2O3qfgieF+HUfCgNWpCeZ2BCpuXKbYiYmZJoQtg4qcIc5Inp649T+3fejBL/1+lg1ra4oifpu
	GFGMzrCTyOMO9uFLHKjEfjF3DgJrohvnJhBKwj6ft4+S6lbToZWkoyYsrGmDcqkA5FNZ1n7aCjF02
	DuUSVEPeqWj0yto0xOokYjVlwHXzfeftP0+ll5jiIOnhGCpGvuBhBwTbl02QEqfkH/Z2+SJYsAZsn
	AzWX5UaPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5oSz-0008SX-0a; Sat, 30 Jan 2021 11:31:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5oSw-0008Rc-2u
 for linux-arm-kernel@lists.infradead.org; Sat, 30 Jan 2021 11:30:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6335C64DDB;
 Sat, 30 Jan 2021 11:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612006257;
 bh=lWKyvAttHUJclQA26tKpBDuv/AngcAy6vqDiPCUX2Aw=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j6YZTlC/Gp10AGRiJwHph/dv+mwNdCWU2pNCmcu/LjNPIJtxNyDV3zD97vp92tTt8
 r5CaMXnAM4flVGDzJorC7taoJH92L3Quhb5vFfR09DP4PkKb9fWwf4iHzANgaE95/E
 himzii7avo23lzaogAcza1vNiGFv4UZD6ZiPepN2nVAEUfnhQmHFYbaf2amlsYLoM9
 DHzUiJWp4sMmrZDJ+maElZB7P7krPyx9g2Tuf+fRp2HFLzY4X1mjeUGWbJ0pril0hD
 /Nww9y1h2ZzJn7k5tSrMZtvSa8cYho7K/ES6ijL62Z77+TeJIs9W7k1r7ec2zSO9/K
 cih/931YCgtuw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Kevin Hilman <khilman@baylibre.com>, arm-soc <arm@kernel.org>,
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>
Subject: Re: [GIT PULL] STM32 DT fixes for v5.11 #1
Date: Sat, 30 Jan 2021 12:30:46 +0100
Message-ID: <161200622954.2192465.3399195515252953534.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <b7379980-857e-736a-85d8-58e2bd300141@foss.st.com>
References: <b7379980-857e-736a-85d8-58e2bd300141@foss.st.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_063058_190957_AB58EE7A 
X-CRM114-Status: UNSURE (   9.08  )
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
Cc: Marek Vasut <marex@denx.de>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Arnd Bergmann <arnd@arndb.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210130113046.ju9SxPHWulpDf_a_wZLWU4E5mpyryIiUV9hILr5t9Jg@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 25 Jan 2021 17:21:52 +0100, Alexandre TORGUE wrote:
> Please consider this first round of STM32 DT fixes for v5.11. It
> concerns DHCOM/DHCOR fixes.
> 
> Thanks
> Alex
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: e6777b8d35dc140033476b8f5ae21e8e5440baea

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
