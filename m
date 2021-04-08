Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EFBAC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 20:05:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13EBE60FDA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 20:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13EBE60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JckLI1gRQkXWTyTj/FvApsRUC4q1j163Bw6KW0vn8Zo=; b=Pq5id42kIpAcjQP9uRIX2Kw5D
	P61iau7HaMcWND1p9Vl7ryCKWPIF5Osheq0wgThBKPnafhQ/qhW9VemHWcNH1ryjka3fi6El2cb2+
	v3VQASnjGvKnesxg9+FY8/W3zvf5Y/WXQY0ZdL5d99aphYBI8wRxweH9ex9rTk50VY3oesrlG02H3
	4xsEfexrHiiYCi9l5ph3/SrMpN0J6WEjWNWj6X2Odnn8ou1y9bhB1PJmuVpAQcAp7OV2U530gds61
	Rx7CgW5X35KBANCPISXdJ2SnsTeqPPY480cSPS+Rz2wykrJCe5yguFTW0u8bSMHMGbve2QHgN/nCP
	zSEDbjHGw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUasi-0099ZS-HF; Thu, 08 Apr 2021 20:04:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUase-0099Yx-0c
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 20:03:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2ADDB60FDA;
 Thu,  8 Apr 2021 20:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617912234;
 bh=FRDrpqf2whLb4ENIJlbQcXJYZCt0R5EwgGMdwXSuFfs=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uC6O3OYXTDZA4vsYMgc8cM44X+21rLqdPy2VZU1e3QlM+dGsoWqwqlDcMM/IGi+hX
 GXitjvPj5hCrHnZk+o3qNDQM9CzOq1rdYImgs3b5ikD9ro9RZbBn+jO9zF6vgouGVD
 kKZsVODfor3fAwFZBmpBxr36WyC5g/UQUUFDTfyzMcThFqj+FQikLVkAJBjaIh9S99
 l5azgWK5vOexL3mWjsvvsw+2HWm/4Kg8Kfyv9CjypPDIeqRQ72TPCI4prICSMllDEf
 gOEOQ92z0QJNzt5owrIOYJEo4OkCne7gYZSQHx1iLJZPbDcpykVlYsIItKxLyKzzcl
 oP8/zdrKb9FVg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL 3/3] ARM: samsung: mach/soc pull for v5.13
Date: Thu,  8 Apr 2021 22:03:32 +0200
Message-ID: <161791219775.1659621.2558335087414364117.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210407065828.7213-3-krzysztof.kozlowski@canonical.com>
References: <20210407065828.7213-1-krzysztof.kozlowski@canonical.com>
 <20210407065828.7213-3-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_210356_368473_942AF26F 
X-CRM114-Status: UNSURE (   6.81  )
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
Message-ID: <20210408200332.4EVlitF88TvvJ6TFjSOJPDUEgYA-BD0oyCsDDLufgKg@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 7 Apr 2021 08:58:28 +0200, Krzysztof Kozlowski wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.13
> 
> [...]

Merged into arm/soc, thanks!

merge commit: a0c97a6bd63019707f16d36812a5aa2fce3fe29f

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
