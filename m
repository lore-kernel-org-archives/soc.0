Return-Path: <SRS0=esR3=FA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE3F5C63798
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2020 21:19:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DB3121D1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2020 21:19:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JfckEK7c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9ijnZGt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DB3121D1A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7MIUR9z0/vKjJZvfFTP01czToWbCpLysBuv+7KS3cbc=; b=JfckEK7cyBIALlgMt+MwfvQfq
	+RfIXL8QhVXzYAYRlNO3QeOrJoLeaYSTXod9fQb9cO6Z/juJg5WiiZBYQ3MYVt97aPszIU6QrRTjA
	oW0Bf4jm6UUnlEkdqkcJpsZ2O1wPl/eO1xU4zp61o38HqGYBDC8kd0TbVrvA1wMLZ08K2mTOY1qCE
	AVVXuv+QsBiqTcD7+YwsuwBaP2t/8zQvjmJesQfhgN1QAj7w9JnDJEwJFYV8SiJHvI9sTpsbzLSgd
	C3hhAzB7J4kcFF9O6VBiqMD+35R0pnci9McaQCh+mrw9q+cK74osMMd4paPGws5YuYMUi8xb33ECV
	tDF/S0R3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiOdt-0005kV-9k; Thu, 26 Nov 2020 21:17:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiOdm-0005iS-M7
 for linux-arm-kernel@lists.infradead.org; Thu, 26 Nov 2020 21:17:23 +0000
Received: from threadripper.lan
 (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 77785221FA;
 Thu, 26 Nov 2020 21:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606425442;
 bh=C9XAjE0/vdrTIqtYOSKtLrMqP6ngh0aVLriHwvFwL6Q=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c9ijnZGt0jBu4ITdCx6Xk1YRI1AcBYxk5HLtOUkhL4nRgflDKI+tEplXCj0hdGc4E
 z0jWp2YHUG2+MBfMlma/aXieOKibT4ClFF4eVIUfv6ZQMmAg05jqPG9b2uU0iveICW
 X0mDirWEaUmzbtjmF/pxK7xvErUMfZr8yz8dISqU=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, soc@kernel.org, arm@kernel.org
Subject: Re: [GIT PULL] arm64: tegra: Device tree fixes for v5.10-rc6
Date: Thu, 26 Nov 2020 22:17:13 +0100
Message-ID: <160642540729.1426580.3199546669902175491.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201125170306.1095734-1-thierry.reding@gmail.com>
References: <20201125170306.1095734-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_161722_922387_4BE450F1 
X-CRM114-Status: GOOD (  12.07  )
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
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201126211713.vR9HwBqUXkAn-hMIVL5scaBKE5b1VhMsBPz06XFtaQE@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 25 Nov 2020 18:03:06 +0100, Thierry Reding wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.10-arm64-dt-fixes
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 06ceddef30a58ddb4393176c78fd4dccc14dbfde

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
