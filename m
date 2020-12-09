Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C05C4167B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 20:32:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E33B22B39
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 20:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E33B22B39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y+quvXzanZqURdNwiY8id5kBCfsX0Mkm7VdmuIq27mE=; b=IXGUZvdm64cz7GLt3soDl14tN
	+eHX3teem+oYgMDJc3zo+w/Ay/0+70YRko0NjKnS8sevPtcPZiUzfz7WUhbARYl3qOFKkTB4ziEp+
	InYQbpX/UnmTNBVjXlw8T8aaarxKcgisbnxW6ap75N+brs/XGQgpd1HcATJ2OaZnNAl/aag1oc18p
	lE+R5RhgArc1CI2NtD0pwYJ8G74mnJnsCv1kS2SpxQljmpfG8BuQoN6uflgdz6KBo7Mii+0on2Nsu
	n/E9kMOpv20XfhYoOmi2wdv5sa8YsycivgMiQxSw1EhEEcCobGVHC/ci9vmDv8PbU6K3hg9xcufIS
	5z9uomTuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn66u-00041y-50; Wed, 09 Dec 2020 20:30:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn66n-0003yk-Of
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 20:30:46 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Daniel Palmer <daniel@0x0f.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 00/10] ARM: mstar: Add basic support for i2m and SMP
Date: Wed,  9 Dec 2020 21:30:36 +0100
Message-ID: <160754580092.2405127.3766119889615848962.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201134330.3037007-1-daniel@0x0f.com>
References: <20201201134330.3037007-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_153045_941006_DB01B351 
X-CRM114-Status: GOOD (  11.50  )
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
Cc: olof@lixom.net, robh@kernel.org, w@1wt.eu, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209203036.lB6NMxYsu3ML4POouynjRbP1PlH1KFFxk-bG7mRAxy4@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Dec 2020 22:43:20 +0900, Daniel Palmer wrote:
> Sorry for spamming this. I wanted to fix the DT parts
> before anyone spent time looking at the DT related commits
> in v1.
> 
> This series adds basic support for the infinity2m series
> of chips. For now the SigmaStar SSD202D which is a dual
> Cortex A7 in a QFN128 package.
> 
> [...]

Applied to arm/dt, thanks!

[01/10] dt-bindings: mstar: Add binding details for mstar,smpctrl
        commit: 80e73332ee829cd55d86272b7d3d4d5f0fc4c4ff
[02/10] dt-bindings: vendor-prefixes: Add honestar vendor prefix
        commit: 43181b5d8072dd92513dca995789a1a1123ffc8a
[03/10] dt-bindings: mstar: Add Honestar SSD201_HT_V2 to mstar boards
        commit: 8c50a8b359c4f262a05ed5fb05373177d11bd20c
[04/10] ARM: mstar: Add infinity2m support
        commit: ba2290b1b7505b28912092a0976e071a447ee18c
[05/10] ARM: mstar: Add common dtsi for SSD201/SSD202D
        commit: 572ef97bc7341b45c721d79f98262c4adb25919c
[06/10] ARM: mstar: Add chip level dtsi for SSD202D
        commit: dbbaf35d589e554d5956780282feb5d62d7f2af6
[07/10] ARM: mstar: Add dts for Honestar ssd201htv2
        commit: 418cb58b45661724ba145bd769e53910ad9324b0
[08/10] ARM: mstar: Add smp ctrl registers to infinity2m dtsi
        commit: 570e471ce0540165aed5bc638e462de7c1110a28
[09/10] ARM: mstar: Wire up smpctrl for SSD201/SSD202D
        commit: ecaafac1eb73de8209680ec030769a2def4801e5
[10/10] ARM: mstar: SMP support
        commit: 5919eec0f09214901b09faeaf6341addebc57a89

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
