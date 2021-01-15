Return-Path: <SRS0=ftTf=GS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9784C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 17:27:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A52C20691
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 17:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A52C20691
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hHyQWYtaTUrYOXqiLVBv0ePysES0Y9zhvAZJuR15PS4=; b=BIars9iYDCS3RGrDsTSWeW79b
	kmkicqlB86RjmPZ82gYPRhZBZGX8tvEGuONgpcviaT+R332W4hTei9+WnjihSEcQYtRBOxKIXWs/M
	uOkFVh9z6o72i4/OEgmay8es8KKpy4CXx91zkLtRfJb0Lf47S7bgH+qD1DF45S0fw5y7q0wlsU8G4
	CzLKixvpJQ+O5pujYS/peCd06pW5P4Pj8NckzLDw4fxy/GAxrwOGLCOpl5SX1WEmRUEtNwNpY3RGp
	JxQbe4xspFgVmF1L1E/YaGhGf04huLvZrsGCIJUPXW8h/LFynsB4Avqro13zMjOBUYEbIiqZP71Je
	06W0SgdcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Sr0-0005iI-EO; Fri, 15 Jan 2021 17:25:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0SqA-0005SA-V2
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Jan 2021 17:24:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2682A2371F;
 Fri, 15 Jan 2021 17:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610731490;
 bh=Gwmi/G1njOf9T/qUcU14aboWHyJnEjiCOG7ILISOnEs=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YPjxJp/1wa9VNt07qadYpL3BijqPeoyBQcALCXYONp4mIes+kCuZoVwblKUQvieps
 4BnWG7mNUwT8oQVPwto1NnGa16/lYoTXEptFU1kZvd8ahacVfdbFroxAukqBEYl3qv
 0LwbNEQSdB8FUHnaEDzzA3OrZpr9rClLnmep4cfIgT0sqtQrY+DMZFBAoahgwb/yiE
 xGgUIWTUJq3vgkdPlEMn2aWDEyWQI+1QT5idA+/nyFAnXhi1NGoiyFL8IEnzFHRnq2
 ae6wKScv9l2c/NFtfKKNN7AR5EXeuU9zR69v2+Gaykcv4561Eo81LOvB0iHam5dnWe
 3nKtG3qcVPwFg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, Jisheng Zhang <Jisheng.Zhang@synaptics.com>, soc@kernel.org
Subject: Re: [GIT PULL] berlin dts32 changes for 5.11
Date: Fri, 15 Jan 2021 18:24:39 +0100
Message-ID: <161073140415.707311.15350876748529801825.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211100521.2e6f4faa@xhacker.debian>
References: <20201211100521.2e6f4faa@xhacker.debian>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_122452_312676_577D81E9 
X-CRM114-Status: UNSURE (   8.49  )
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
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210115172439.ipJ9219GHAz8d3aWtLWh-tXNTRQoU5HzkAVDF9weatc@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 11 Dec 2020 10:05:21 +0800, Jisheng Zhang wrote:
> Here is the dts32 changes for berlin for v5.11. Please kindly pull.
> 
> thanks
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: b9e7773e229dd338ee53e225cb69c983cb74683d

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
