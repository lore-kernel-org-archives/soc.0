Return-Path: <SRS0=fGbl=O4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08040C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 20:13:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C454160F93
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 20:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C454160F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5bEodxVuK1iKn5/5P2+628iUAONt88+ePI1mIhg/Afc=; b=Zd+A/nPNCW8tkz
	fYV0Nc2cGVA2U+hiCPrwvqbLn0XRz2BLcu2FSIe+YHQKXm9/y5ToUadIWnT/Zru9cDi5lEBUQUp7u
	O5iwlTJWpyGkpuELEESx+R2Oh2rg8cH/kmhhROWl1+2OzZKYbQEKKtAO7SW6DNY9131C3y0+mS4mB
	FyZCAdHBiSo2sjumWEyg5a73h1EpgupXG/rCRIj0mB5aUGrvddnvJ14n3PbmnsjEsBiKMz+wfgBkK
	+zQ9DmpneNZxQ7PZ04bo7druUgwKBOzhNjW1HOJyzTLcgq2QSOvXLj0BPmmtKqKfFxp8bUP2qs1Sf
	mYxJqqMi7m43p7rEFjTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYwDe-0042l5-Vf; Fri, 08 Oct 2021 20:11:51 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYwDR-0042gv-JK
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Oct 2021 20:11:38 +0000
Received: by mail-wr1-x429.google.com with SMTP id s15so33142531wrv.11
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 08 Oct 2021 13:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=URri40ZXaY0OFhtJME26qwrD1O071Yx6D/e2sBUCLRY=;
 b=VPu2ihICGlHKjxu5M8qHobMtZu0o/O0A4l7rMrq/i1E03H7vBCRIRDp4S033Wjj2Vm
 I122nU62cO0UJjI4ry3NH0eK7nfOyJ1KA6QQwVnNGBs6UKAyluney7LidHg5B0gIZvNn
 jeYzoT5O2V7aS4xNK/yDe7rgYvwZrfnRAnLkZoSVuoPYlI/ZTvCcSASkDdW9iNg02rNX
 pS6DNhDVhJRpFiUF/xGzo+FORp/WjRKCeu6Wgvbf3PWXM6EQsVe52s/1K4CGfUOBWTxt
 b47jzJmVBLk3grb9ffavudgsWmI1ZFnxTBU6gsn/wtIbU+wkpCpOs4mXt0E2pdSeKhaT
 AH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=URri40ZXaY0OFhtJME26qwrD1O071Yx6D/e2sBUCLRY=;
 b=4Bdu+p4EO00nMR0tfF0jjSC6kNNeqGI2tCMP13uig2ele9u4XdfASmkTRUfgSt2Tb/
 /Os11znq/B9Iy8wj+ebRP4sxb0SlbBWgjzYFWBKrQfSzzUs4c7X/dgGmPtrzsbtxJMXV
 HvMpN7uYH/phbTgP69D69ekwowc/XwopfVZlpnwZBu8gz9mNlvhiAl5vn7f5iJHzxU9t
 n5QmgBGh/5hEYc8ZF9JT52XAmn0zbOdSK6I5RHrbWzDqAvBD76CfG3/Yl0jrDK8CTlVV
 qsB9yoiOTKNjzC64PQx1L/xtQOGwHj7XbX4zAL3vzUgM3rauEeIiVtRljdrL0KLsW3ZE
 iBbw==
X-Gm-Message-State: AOAM530gSSVChya5+pQo0HXEwVXSrZmw2zB9LOgFMj8iGSSIYpVYtJIi
 l65Z8hw/bMByjh76lnzAdwzQSdE7oTY=
X-Google-Smtp-Source: ABdhPJxsxUHf6OLRz12MGt9tZ12cq+K1UU29Y5KK8rEY8KuyDdJcHSjlrom09MFyy4UnfUVSEBgdoA==
X-Received: by 2002:adf:a209:: with SMTP id p9mr6603590wra.70.1633723896167;
 Fri, 08 Oct 2021 13:11:36 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id s2sm258322wrn.77.2021.10.08.13.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 13:11:35 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/7] dt-bindings: Changes for v5.16-rc1
Date: Fri,  8 Oct 2021 22:11:26 +0200
Message-ID: <20211008201132.1678814-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008201132.1678814-1-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_131137_656556_88A1EE0E 
X-CRM114-Status: GOOD (  11.40  )
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
Message-ID: <20211008201126.mIsCM-iq68AEAYnqlYzkic2z-0u8rdAfbPn_HEa2Lh8@z>

Hi ARM SoC maintainers,

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-dt-bindings

for you to fetch changes up to 354754f559507e0dba014aa830c70e73e7d52f98:

  dt-bindings: PCI: tegra194: Fix PCIe endpoint node names (2021-10-07 21:24:25 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.16-rc1

This contains the DT bindings for the NVDEC hardware video decoder found
on Tegra210 and later chips as well as a node name fix for the examples
in the Tegra194 PCIe controller (endpoint mode) DT bindings.

----------------------------------------------------------------
Mauro Carvalho Chehab (1):
      dt-bindings: PCI: tegra194: Fix PCIe endpoint node names

Mikko Perttunen (1):
      dt-bindings: Add YAML bindings for NVDEC

 .../bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml | 106 +++++++++++++++++++++
 .../bindings/pci/nvidia,tegra194-pcie.txt          |   2 +-
 MAINTAINERS                                        |   1 +
 3 files changed, 108 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
