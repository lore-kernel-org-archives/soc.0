Return-Path: <SRS0=NGH2=F3=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04349CDB482
	for <soc@archiver.kernel.org>; Fri, 13 Oct 2023 15:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E07B7C433CB; Fri, 13 Oct 2023 15:37:30 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 07374C433C7;
	Fri, 13 Oct 2023 15:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 07374C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9be02fcf268so43836266b.3;
        Fri, 13 Oct 2023 08:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697211448; x=1697816248; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYPDhOVkv0waUVLnmOjl9NknnpY9Oe/qv6LhVI9mZSA=;
        b=nsK9ktpz0L5B9+59zibOAAwpjhQm0//xz/8fkQ1zs7GDu1EdNAjerlm5KS2DU8s5c2
         qijloOvxfTj+zUln7eRR7CbN6n7GdFyPzggu3htEAmxC8BY/opkHsyRtndbMBrpdvqUi
         TfrKSue7CyAtYtKOgKqk+sxGKiSVlvJOMDMnk/xRQJwdQJOPQJnrj9Zfq4tbG+D608ot
         WbbkUie+NrqvVA/L4yTao2q25LaVXW+jRIAdVgWvgKEevkbatTZrUGBine+UGPsNTdv/
         uXVjLZhljkPD9HrN+3Vl2dw3/K4TiWR64xb+6LkehOYPz+QTFjcHByoSzu8s5iEluYFf
         9SPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697211448; x=1697816248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYPDhOVkv0waUVLnmOjl9NknnpY9Oe/qv6LhVI9mZSA=;
        b=Uiy49AwDp6rwvfw3o8O9FgJGN9SmRvaJczUj1KipNAOpxmwSR5Ai37bm34C7N0szgt
         0ElJzBo7YAnI+ZwuxmhZ2HjoEtlfthPfAEw0d65osayeTPn4frD5tl1t8CZWMR6Ia04B
         XYWTabshSkOr9wGgG03n6Gt3wCwoft/ipZatP+Ag6F7+TH4pBRZdXSlasJwPUW2uYGcF
         A1GvfQMwASCb1fCTlVVfkiv8WI0eP0A8fClj6rovmqdLgBCNxK6ru4W8rHnaNY4yX9dG
         5KuGRLSmmJJwVSOyVGXk7xMp3l1gTOx5zpvhjqcxRnhPTUOPNF8anRh8hqav09z15rNV
         tDaQ==
X-Gm-Message-State: AOJu0YywcIpqsFGERz+kErFzD6Zy5vnh293NnNb9HdmrGDeRaeMg6SME
	+awPaxONNeDev65FSTJp9PpssHY3N4A=
X-Google-Smtp-Source: AGHT+IG8nj/Qv2VnFKlzi1cXekL/eiwwgncKIy1UFsOddZljrOd2B4TCVDk6myoz53lqhsLN1GH+wQ==
X-Received: by 2002:a17:906:8465:b0:9b2:8b14:7a3d with SMTP id hx5-20020a170906846500b009b28b147a3dmr25486973ejc.4.1697211447818;
        Fri, 13 Oct 2023 08:37:27 -0700 (PDT)
Received: from localhost (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ca9-20020a170906a3c900b009adc743340fsm12588732ejb.197.2023.10.13.08.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 08:37:26 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] dt-bindings: Changes for v6.7-rc1
Date: Fri, 13 Oct 2023 17:37:19 +0200
Message-ID: <20231013153723.1729109-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231013153723.1729109-1-thierry.reding@gmail.com>
References: <20231013153723.1729109-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.7-dt-bindings

for you to fetch changes up to 0434281722b5192f4c5f60ff891f98f95057a793:

  dt-bindings: arm: tegra: pmc: Relicense and move into soc/tegra directory (2023-10-10 17:39:33 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.7-rc1

This contains some rework of the Tegra PMC device tree bindings that
will help with validating device trees with json-schema.

----------------------------------------------------------------
Thierry Reding (7):
      dt-bindings: arm: tegra: pmc: Improve property descriptions
      dt-bindings: arm: tegra: pmc: Remove useless boilerplate descriptions
      dt-bindings: arm: tegra: pmc: Move additionalProperties
      dt-bindings: arm: tegra: pmc: Increase maximum number of clocks per powergate
      dt-bindings: arm: tegra: pmc: Restructure pad configuration node schema
      dt-bindings: arm: tegra: pmc: Reformat example
      dt-bindings: arm: tegra: pmc: Relicense and move into soc/tegra directory

 .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml     | 393 -------------------
 .../bindings/soc/tegra/nvidia,tegra20-pmc.yaml     | 416 +++++++++++++++++++++
 2 files changed, 416 insertions(+), 393 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml
