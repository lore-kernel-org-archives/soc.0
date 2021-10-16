Return-Path: <SRS0=Uq4y=PE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 443D3C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Oct 2021 14:04:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10B8061181
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Oct 2021 14:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 10B8061181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VdRe0YHVASDqJC6h1+h4GBg6th+4QSxifNWu9eSD2VM=; b=an2CC6/NiEVsyq
	UzIcKYXgJQeJIDMH3q06JbXaoouE7QSFLj7mqidZrBa6fMNrkDtTdjS6IAOieyfEZ7VQsOrQvfOKu
	/5nst8zJcn0ssKpx+sEJiGAUZxgTwQ1TmQFdh8RDO3JbXGIx717db8Ow6+j5gxDWw2MMOEq1C+eEw
	SSr/YVfa3UkUGtAH+CkGynDmxQCAEUADF6fwpqXJRhKDk6PPjz/mrEvNQI0sMhfWLmp9q6gd4twZM
	0EM2cICMrzDJD3j9lOh16dsqOed8OGSO+J2k3vOurRchu8AOqGRK6+cNrz6qT504qHV/QL26vi/8m
	NsrwHtSKTZLskuiPQIfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbkHB-00Aj3O-ER; Sat, 16 Oct 2021 14:03:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbkGX-00AinD-Cm
 for linux-arm-kernel@lists.infradead.org; Sat, 16 Oct 2021 14:02:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF01461245;
 Sat, 16 Oct 2021 14:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634392945;
 bh=II8m5phxUkggG0v6Cvmt5lfbgA98NX6PbBjQUG9i9Ig=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZbD/a1lJeYIYqVRR8J6h8p7FIpNi4KZfaDfzTacNg49nAagnbA4Knrf9krIcB39eE
 /jzhbhGklk+EtMd8tsC8OBYDTCdf9W9BxMm/FaLurNWSHcfas4Tg54MUmIOxLtsq1c
 qEoasIuzHf0HDBKtpUZ7C6yczEAaR8bu8JgzqDW53oeMSBQdRZOpusYSdD1WwT5TTE
 vHvL6QLdBEXIt096MzRNowELiJGwe/E24YTbv5V/eVxYZHCMD3j4xdZDvINRSe3Xcg
 j4UWei5hIjybZ5hVakB1jU8CILanvrrl+4woKS25RysVMfNVRZlMGhhU+DYrmCcmQa
 5b5bygZoFadfA==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
 kernel@pengutronix.de, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] i.MX maintainers update for 5.16
Date: Sat, 16 Oct 2021 22:01:38 +0800
Message-ID: <20211016140138.1603-6-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211016140138.1603-1-shawnguo@kernel.org>
References: <20211016140138.1603-1-shawnguo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211016_070225_480480_83CBCC99 
X-CRM114-Status: UNSURE (   5.28  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211016140138.9XKKyascxv7JvXR0cepEl31VKYglQX_3p9mgCzQsIUo@z>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-maintainers-5.16

for you to fetch changes up to aa854c4aa715ab0ee76d537824f5abcd0a4120df:

  MAINTAINERS: add an entry for NXP S32G boards (2021-10-04 16:10:38 +0800)

----------------------------------------------------------------
i.MX maintainers update for 5.16:

- Add a new entry for the maintenance of NXP S32G device tree files.

----------------------------------------------------------------
Chester Lin (1):
      MAINTAINERS: add an entry for NXP S32G boards

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
