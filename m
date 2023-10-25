Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5591C07545
	for <soc@archiver.kernel.org>; Wed, 25 Oct 2023 20:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98827C433C7; Wed, 25 Oct 2023 20:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F41CC433C8;
	Wed, 25 Oct 2023 20:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698264410;
	bh=ovrCQ8mHfkD/Mzieohw7sYtv/CIBV1f3n7uXXBt0Mqc=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=FPcBlFS8oNlEhoByiJ3tWlIQfqyY9G3pfXNG43O/D9y5b/jXldteTzf/vsOVXth3J
	 hweAyj+0Yvp+n0FcQgiVUDZmPKLha8qYJc/V/sU2Ss6dy4QWpB2Eyy0AvhIjAnvhzC
	 lKbBxJKRO0B2A8MkP3LCFhrgHBDTruHa09g8I5tUWBH36l3NWRYvRrP4sCB84/JXhE
	 imzFke8fMXEzFaTOGywrSK7vj7Ex6vSbYFyCS6VMnE9bj++K6FMF/uSpH9aIkYHdrG
	 MBcHJSaAmSdW1KCp0AtZBololalZzWcbtVvOyXVpbaQ39qRdno1JfAjKk2dDAt9yiT
	 k8TUPeFHR7KAg==
From: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Subject: [GIT PULL] More Qualcomm driver updates for v6.7
Date: Wed, 25 Oct 2023 13:11:07 -0700
Message-ID: <20231025201109.1016121-1-andersson@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit c0989f7d1264b2b1885345a28a32fd5e1e61f9c7:

  soc: qcom: socinfo: Convert to platform remove callback returning void (2023-10-02 11:30:39 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.7-2

for you to fetch changes up to 723d346173e748c4fdb145b84f572b871ab4011a:

  soc: qcom: pmic_glink_altmode: Print return value on error (2023-10-22 09:20:40 -0700)

----------------------------------------------------------------
More Qualcomm driver updates for v6.7

The Qualcomm SMC an QSEECOM drivers are moved into a "qcom"
subdirectory, to declutter the base directory. Missing include guards
are added to the qseecom header file. Unneded extern specifiers are
removed from the scm call wrappers.

__counted_by is added to the apr_rx_buf structure, in the APR driver.

Lastly in the pmic_glink driver the pmic_glink drm_bridge type is
corrected to DisplayPort, over the incorrect "USB" value. The return
values are added to error prints for the various typec set() calls.

----------------------------------------------------------------
Bartosz Golaszewski (4):
      firmware: qcom: qseecom: add missing include guards
      firmware: qcom: move Qualcomm code into its own directory
      firmware: qcom: scm: add a missing forward declaration for struct device
      firmware: qcom: scm: remove unneeded 'extern' specifiers

Dmitry Baryshkov (1):
      soc: qcom: pmic_glink: fix connector type to be DisplayPort

Gustavo A. R. Silva (1):
      soc: qcom: apr: Add __counted_by for struct apr_rx_buf and use struct_size()

Luca Weiss (1):
      soc: qcom: pmic_glink_altmode: Print return value on error

 MAINTAINERS                                        |  4 +-
 drivers/firmware/Kconfig                           | 48 +------------------
 drivers/firmware/Makefile                          |  5 +-
 drivers/firmware/qcom/Kconfig                      | 56 ++++++++++++++++++++++
 drivers/firmware/qcom/Makefile                     |  9 ++++
 drivers/firmware/{ => qcom}/qcom_qseecom.c         |  0
 .../firmware/{ => qcom}/qcom_qseecom_uefisecapp.c  |  0
 drivers/firmware/{ => qcom}/qcom_scm-legacy.c      |  0
 drivers/firmware/{ => qcom}/qcom_scm-smc.c         |  0
 drivers/firmware/{ => qcom}/qcom_scm.c             |  0
 drivers/firmware/{ => qcom}/qcom_scm.h             | 15 +++---
 drivers/soc/qcom/apr.c                             |  4 +-
 drivers/soc/qcom/pmic_glink_altmode.c              | 16 +++----
 include/linux/firmware/qcom/qcom_qseecom.h         |  6 +++
 14 files changed, 93 insertions(+), 70 deletions(-)
 create mode 100644 drivers/firmware/qcom/Kconfig
 create mode 100644 drivers/firmware/qcom/Makefile
 rename drivers/firmware/{ => qcom}/qcom_qseecom.c (100%)
 rename drivers/firmware/{ => qcom}/qcom_qseecom_uefisecapp.c (100%)
 rename drivers/firmware/{ => qcom}/qcom_scm-legacy.c (100%)
 rename drivers/firmware/{ => qcom}/qcom_scm-smc.c (100%)
 rename drivers/firmware/{ => qcom}/qcom_scm.c (100%)
 rename drivers/firmware/{ => qcom}/qcom_scm.h (92%)
